import generate_person
import database_models
import read_write_pickle
import dataclasses


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
    #print(type(people_list[0]))
    #people_list_to_pickle = [dataclasses.asdict(p) for p in people_list]

    data = session.query(database_models.User).all()
    people_list_to_pickle = [row.__dict__ for row in data]
    read_write_pickle.save_pickle(people_list_to_pickle)
