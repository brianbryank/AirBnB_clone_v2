#!/usr/bin/python3
"""This is the state class"""
from models.base_model import BaseModel, Base
from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import relationship


class State(BaseModel, Base):
    """This is the class for State"""

    __tablename__ = 'states'

    name = Column(String(128), nullable=False)
    cities = relationship('City', back_populates='state', cascade='delete')

    if models.storage_type != "db":
        @property
        def cities(self):
            """
            getter for cities
            """
        cities = []
        insta = models.storage.all(City)
        for value in insta.values():
            if value.state_id == self.id:
                cities.append(value)
        return cities
