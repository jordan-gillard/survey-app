import json

from flask import current_app as app, request, jsonify, abort

from src.python.server.models import Hospital, Response


@app.errorhandler(400)
def bad_request():
    return jsonify({
        'success': False,
        'response': 'Bad request',
        'error': 400
    }), 400


@app.errorhandler(404)
def method_not_allowed():
    return jsonify({
        'success': False,
        'response': 'Method not allowed',
        'error': 404
    }), 404


@app.route('/api/hospitals/<int:hospital_id>/questions', methods=['GET'])
def get_questions(hospital_id):
    hospital = Hospital.query.filter(Hospital.id == hospital_id).one_or_none()
    if hospital:
        questions = [question.serialize() for question in hospital.questions if question.active]
        return jsonify({
            'success': True,
            'hospital_id': hospital.id,
            'hospital_name': hospital.name,
            'questions': questions,
            'total_questions': len(questions)
        })
    else:
        return abort(404)


@app.route('/api/responses', methods=['POST'])
def receive_responses():
    response_json = json.loads(request.data)
    try:
        hospital_id = response_json['hospital_id']
        for response_dict in response_json['responses']:
            response = Response()

            response.question_id = response_dict["question_id"]
            response.hospital_id = hospital_id

            option_selected = response_dict["option_selected"]  # bool
            if option_selected:
                response.option_id = option_selected

            response_text = response_dict["response_text"]  # bool
            if response_text:
                response.response_text = response_text

            response.commit()

        return jsonify({
            'success': True
        })

    except:
        abort(400)


@app.route('/health')
def health_check():
    return jsonify({
        'success': True,
        'status': 'healthy'
    })
