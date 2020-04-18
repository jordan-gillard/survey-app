from flask import current_app as app, request, make_response


@app.route('/api/hospitals/<int:hospital_id>/questions', methods=['GET'])
def get_questions(hospital_id):
    pass


@app.route('/api/responses', methods=['POST'])
def receive_responses():
    pass
