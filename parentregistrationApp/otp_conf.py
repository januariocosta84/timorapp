import re
from twilio.rest import Client
import os
from twilio.rest import Client
import time


from twilio.rest import Client

def sentotp():
    account_sid = ''
    auth_token = ''
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