import generate_person
import database_models

from sqlalchemy.orm import Session

number_of_people_to_generate = 20

people = generate_person.get_schema_definition(20)

with Session(database_models.engine) as session:
    people_list = []
    for p in people:
        people_list.append(database_models.User(uid=p["uid"], name=p["name"], favourite_food=p["favourite_food"], version=p["version"]))

    session.add_all(people_list)
    session.commit()
    
        
