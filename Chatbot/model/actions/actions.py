from typing import Any, Text, Dict, List

from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher

import json
import os


class ExtractFoodEntity(Action):

    def name(self) -> Text:
        return "action_extract_food_entity"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        with open("configuration/menu.json") as f:
            loaded = json.load(f)

        food_entity = next(tracker.get_latest_entity_values('food'), None)

        for item in loaded['items']:
            if food_entity == item['name']:
                dispatcher.utter_message(text=f"You have ordered {food_entity}.\n"
                                              f"It will cost {item['price']} and should be ready in {item['price']}h.\n"
                                              f"Is that correct?")
                break
        else:
            dispatcher.utter_message(text='I am sorry, but I was not able to process your order')

        return []


class ExtractDayEntity(Action):

    def name(self) -> Text:
        return "action_extract_day_entity"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        day_entity = next(tracker.get_latest_entity_values('day'), None)

        with open("configuration/opening_hours.json") as f:
            loaded = json.load(f)

        if day_entity in loaded['items']:
            dispatcher.utter_message(text=f"On {day_entity} the restaurant is open from {loaded['items'][day_entity]['open']} to {loaded['items'][day_entity]['close']}")
        else:
            dispatcher.utter_message(text="I am sorry, but I don't know what day are you asking about")

        return []
