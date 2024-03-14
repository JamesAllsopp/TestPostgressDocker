from mimesis import Generic

from mimesis.locales import Locale
#generic = Generic(locale=Locale.EN)

#print(generic.person.username())

from mimesis import Field

#field = Field()
#field("person.username", mask="U_d", drange=(100, 1000))
#print(field)

from mimesis import Field, Fieldset, Schema
from mimesis.enums import Gender, TimestampFormat
from mimesis.locales import Locale

field = Field(Locale.EN, seed=0xfff)
fieldset = Fieldset(Locale.EN, seed=0xfff)


def get_schema_definition(number:int):
    schema_definition = lambda: {
        "pk": field("increment"),
        "uid": field("uuid"),
        "name": field("text.word"),
        #"balance": field("text.number"),
        "favourite_food": field("dish"),
        "version": field("version"),
        "timestamp": field("timestamp", fmt=TimestampFormat.POSIX),
        "owner": {
            "email": field("person.email", domains=["mimesis.name"]),
            "creator": field("full_name", gender=Gender.FEMALE),
        },
        "apiKeys": fieldset("token_hex", key=lambda s: s[:16], i=3)
    }

    return Schema(schema=schema_definition, iterations=number)


# schema = Schema(schema=schema_definition, iterations=1)
# person = schema.create()
# print(f"{person[0]:} {person[0]['name']}")

