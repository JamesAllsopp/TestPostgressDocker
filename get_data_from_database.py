from sqlalchemy import select
from sqlalchemy.orm import Session

import database_models


def get_everyone_from_user_table():
    session = Session(database_models.engine)
    query = select(database_models.User)
    returned_values = session.execute(query)

    return returned_values.all()

vals = get_everyone_from_user_table()
print(vals)
