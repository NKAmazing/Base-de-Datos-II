import tarfile as t

item = t.open("/home/nicolas/Documentos/jupy/jup_notebook/base-de-datos-ii/data/clima.tgz", "r:gz")

item.extractall("/home/nicolas/Documentos/jupy/jup_notebook/base-de-datos-ii/data/")

item.close()
