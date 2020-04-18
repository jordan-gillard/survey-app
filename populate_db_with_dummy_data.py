from os import environ

from flask import Flask

from src.python.server import db, create_app, Config
from src.python.server.models import Hospital, User, Question, Option

print('SURVEY_APP_DATABASE_URL is: ')
print(environ.get('SURVEY_APP_DATABASE_URL'))

app = Flask(__name__)
db.init_app(app)
app.config.from_object(Config)

with app.app_context():
    print('Populating database with dummy data...')

    hospital1 = Hospital()
    hospital1.name = "Rush University Medical Center"
    hospital1.id = 1
    db.session.add(hospital1)

    hospital2 = Hospital()
    hospital2.id = 2
    hospital2.name = "Loyola Medical Center"
    db.session.add(hospital2)

    user1 = User()
    user1.id = 1
    user1.username = 'alighane'
    user1.name = 'Ali Ghane'
    user1.email = 'alig@elmhurst.edu'
    user1.set_password(password='P@ssword')
    user1.hospital = hospital1
    db.session.add(user1)

    user2 = User()
    user2.id = 2
    user2.username = 'djensen'
    user2.name = 'Dean Jensen'
    user2.email = 'djensen@elmhurst.edu'
    user2.set_password(password='tryAndRootMe')
    user2.hospital = hospital2
    db.session.add(user2)
    db.session.flush()

    # Questions by Ali Ghane for Rush University Medical Center.
    rush_hospital_question_options = {
        'How long did you wait to see a physician?': ['Right away', '15-30 minutes', '30-45 minutes', '45+ minutes'],
        'How long did you see the physician?': ['0-15 minutes', '15-30 minutes', '30-45 minutes', '45+ minutes'],
        'Were all your topics discussed?': ['Yes', 'No'],
        'Do you have a follow-up visit scheduled?': ['Yes', 'No'],
        'Would you recommend Rush University Medical Center to a friend?': ['Yes', 'No'],
        'How would you rate your visit?': range(1, 11)
    }


    def option_generator(question_id, option_str):
        option = Option()
        option.question_id = question_id
        option.text = option_str
        db.session.add(option)


    for question_str, options_list in rush_hospital_question_options.items():
        question = Question()
        question.hospital_id = 1
        question.user_id = 1
        question.multiple_choice = True
        question.text = question_str
        db.session.add(question)
        db.session.flush()  # This is needed in order to generate an id for question
        for option_str in options_list:
            option_generator(question.id, option_str)

    # Questions by Dean Jensen for Loyola Medical Center.
    loyola_medical_question_options = {
        'How long did you wait to see a physician?': ['0-30 minutes', '30-60 minutes', '60+ minutes'],
        'How much time did you spend with your physician?': ['0-10 minutes', '10-20 minutes', '20-30 minutes',
                                                             '30+ minutes'],
        'Are you satisfied with your visit today?': ['Yes', 'No'],
        'Do you have a follow-up visit scheduled?': ['Yes', 'No'],
        'Would you recommend Loyola Medical Center to a friend or family member?': ['Yes', 'No'],
        'How would you rate your visit?': range(1, 11)
    }

    for question_str, options_list in loyola_medical_question_options.items():
        question = Question()
        question.hospital_id = 2
        question.user_id = 2
        question.multiple_choice = True
        question.text = question_str
        db.session.add(question)
        db.session.flush()  # This is needed in order to generate an id for question
        for option_str in options_list:
            option_generator(question.id, option_str)
    # Finally, commit everything to the database
    db.session.commit()
    db.session.close()
print('Successfully added data to database!')
