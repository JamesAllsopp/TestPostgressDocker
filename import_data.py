import generate_person
import database_models
import read_write_pickle

from sqlalchemy.orm import Session

number_of_people_to_generate = 20

people = generate_person.get_schema_definition(20)

people_list = []
with Session(database_models.engine) as session:
    for p in people:
        people_list.append(database_models.User(uid=p["uid"],
                                                name=p["name"],
                                                favourite_food=p["favourite_food"],
                                                version=p["version"]))

    session.add_all(people_list)
    session.commit()
    read_write_pickle.save_pickle(people_list)
