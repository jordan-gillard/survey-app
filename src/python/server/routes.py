from flask import current_app as app, request, make_response, jsonify, abort

from src.python.server.models import Hospital


@app.route('/api/hospitals/<int:hospital_id>/questions', methods=['GET'])
def get_questions(hospital_id):
    hospital = Hospital.query.filter(Hospital.id == hospital_id).one_or_none()
    if hospital:
        questions = [question.serialize() for question in hospital.questions]
        return jsonify({
            'success': True,
            'questions': questions
        })
    else:
        return abort(404)


@app.route('/api/responses', methods=['POST'])
def receive_responses():
    pass
