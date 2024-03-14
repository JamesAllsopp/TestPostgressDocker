from sqlalchemy import String
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column

from sqlalchemy import create_engine


engine = create_engine(
    "postgresql+psycopg2://postgres:mysecretpassword@localhost:5432/test_database",
    echo=True)


class Base(DeclarativeBase):
    pass


class User(Base):
    __tablename__ = "user_account"

    id: Mapped[int] = mapped_column(primary_key=True)
    uid: Mapped[str] = mapped_column(String(40))
    name: Mapped[str] = mapped_column(String(40))
    favourite_food: Mapped[str] = mapped_column(String(40))
    version: Mapped[str] = mapped_column(String(30))
    #owner: Mapped["Owner"] = relationship(back_populates="user", cascade="all, delete-orphan")

    def __repr__(self) -> str:
        return f"User(id={self.id!r}, uid={self.uid!r}, name={self.name!r}, favourite_food={self.favourite_food!r}, version={self.version!r})"

class Owner(Base):
    __tablename__ = "owner"

    id: Mapped[int] = mapped_column(primary_key=True)
    email: Mapped[str] = mapped_column(String(40))
    creator: Mapped[str] = mapped_column(String(40))
    #user: Mapped["User"] = relationship(back_populates="Owner")


# class ApiKeys(Base):
#     __tablename__ = "apikeys"
#     id: Mapped[int] = mapped_column(primary_key=True)
#     apikey: Mapped[string] = mapped_column(ForeignKey(
