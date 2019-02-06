from invoke import Collection
from . import container

ns = Collection()

ns.add_collection(container, 'container')
