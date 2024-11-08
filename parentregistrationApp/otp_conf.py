import re
from twilio.rest import Client
import os
from twilio.rest import Client
import time
# Create your views here.
# def sentotp(phone_number, otp_code):
#     account_sid = ""
#     auth_token = ""
#     client = Client(account_sid, auth_token)
#     print(client)
#     #number = verify_num(phone_number)
#     #print(number)
#     message = client.messages.create(
#         body=f"your otp code is{otp_code}",
#         from_='+67077121173',
#         to= '+670'+phone_number

#     )
    
#     print(message.body)
#     return message.sid



# def verify_num(num):
#     pattern = re.compile(r'^\+6707\d{7}$')
#     if not pattern.match(num):
#         return "+670"+num
#     else:
#         num

from twilio.rest import Client

def sentotp():
    account_sid = 'AC3704c56723579efe1364b541ae372c58'
    auth_token = '80a4df69f4297b9ca7a460029a5cfa1a'
    client = Client(account_sid, auth_token)

    message = client.messages.create(
     from_="whatsapp:+61438670849",
    to="whatsapp:+67077121173",
        body="Your appointment is coming up on. Please let us know if you need to reschedule",
    )
    print(message.body)

    time.sleep(5)

    # Fetch message status and error details
    message_status = client.messages(message.sid).fetch()

    print(f"Message status: {message_status.status}")

    if message_status.error_code:
        print(f"Error code: {message_status.error_code}")
        print(f"Error message: {message_status.error_message}")

    if message_status.status == "delivered":
        print("Message delivered successfully!")
    elif message_status.status in ["failed", "undelivered"]:
        print(f"Message failed to send. Status: {message_status.status}")
    else:
        print(f"Message status: {message_status.status}")


#sentotp()