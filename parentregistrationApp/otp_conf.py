import re
from twilio.rest import Client
# Create your views here.
def sentotp(phone_number, otp_code):
    account_sid = ""
    auth_token = ""
    client = Client(account_sid, auth_token)
    print(client)
    #number = verify_num(phone_number)
    #print(number)
    message = client.messages.create(
        body=f"your otp code is{otp_code}",
        from_='+67077121173',
        to= '+670'+phone_number

    )
    
    print(message.body)
    return message.sid



def verify_num(num):
    pattern = re.compile(r'^\+6707\d{7}$')
    if not pattern.match(num):
        return "+670"+num
    else:
        num