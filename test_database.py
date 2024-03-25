import pytest
import random
import read_write_pickle
import get_data_from_database


@pytest.fixture
def get_data():
    return read_write_pickle.read_pickle()


#def test_simple():
#    coin = random.randint(0, 1)
#
#    assert coin


def test_data(get_data):
    pkl = get_data
    db_data = get_data_from_database.get_everyone_from_user_table()

    global_bool = True
    for p in pkl:
        print(p)
        found = False
        for d in db_data:
            #Need the [0] to change from a row set to a ORM object.
            print("d[0].uid {} p['uid'] {}".format(d[0].name, p['name']))
            if d[0].uid == p['uid'] and d[0].name == p['name'] and d[0].favourite_food == p['favourite_food'] and d[0].version == p['version']: 
                found = True
        global_bool = global_bool and found

    assert global_bool
