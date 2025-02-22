import requests
import os

from dotenv import load_dotenv
from discord import Intents, Client


load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

intents = Intents.default()
intents.message_content = True

client = Client(intents=intents)


@client.event
async def on_ready():
    print(f'{client.user} is now running')


@client.event
async def on_message(message):
    if message.author == client.user:
        return

    if message.content.startswith('!rasa'):
        user_message = message.content[len('!rasa '):]
        response = requests.post('http://localhost:5005/webhooks/rest/webhook',
                                 json={"sender": "discord", "message": user_message})

        for item in response.json():
            await message.channel.send(item['text'])


client.run(TOKEN)
