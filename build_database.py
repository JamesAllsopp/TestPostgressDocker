# from typing import List
# from typing import Optional
# from sqlalchemy import ForeignKey
# from sqlalchemy import String
# from sqlalchemy.orm import DeclarativeBase
# from sqlalchemy.orm import Mapped
# from sqlalchemy.orm import mapped_column
# from sqlalchemy.orm import relationship
# from sqlalchemy import create_engine
from sqlalchemy_utils import database_exists, create_database

import database_models

if not database_exists(database_models.engine.url):
    create_database(database_models.engine.url)

database_models.Base.metadata.create_all(database_models.engine)
