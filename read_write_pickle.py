import pickle

pickle_filename = "data_to_be_stored.pkl"


def save_pickle(obj_to_pickle):
    with open(pickle_filename, 'wb') as handle:
        pickle.dump(obj_to_pickle, handle, protocol=pickle.HIGHEST_PROTOCOL)


def read_pickle():
    with open(pickle_filename, 'rb') as handle:
        return pickle.load(handle)
