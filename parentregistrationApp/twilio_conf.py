from dotenv import load_dotenv
import os
from twilio.rest import Client
load_dotenv()
import json
def send_otp(phone_number, message):
    account_sid = os.getenv('ACCOUNT_SID')
    auth_token = os.getenv('AUTH_TOKEN')
    from_number = os.getenv('FROM_WHATSAPP_NUMBER')
    content_sid = os.getenv('CONTENT_SID')

    client = Client(account_sid, auth_token)
    phone_number = f"whatsapp:{phone_number}"
    
    try:
        message = client.messages.create(
            from_=from_number,
            to=phone_number,
            content_sid=content_sid,
            content_variables=json.dumps(
                {
                    "1": phone_number,
                    "2": message,
                }
            ),
        )
        print(f"Message sent successfully. SID: {message.sid}")
        print(message.body)
    except Exception as e:
        print(f"Error: {e}")
        