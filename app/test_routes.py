from flask import Blueprint, request, jsonify
from app.models import db, Item

# Blueprint solo con endpoints de prueba para cursos
main = Blueprint('main', __name__)

@main.route('/') # Ambas rutas llevan al mismo lugar
@main.route('/dashboard')
def index():
    """
    Página de inicio pública (home).
    """
    return '<h1>Corriendo en Modo de Prueba.</h1>'

@main.route('/items', methods=['GET'])
def listar_items():
    """
    Retorna una lista de items (JSON).
    """
    item = Item.query.all()

    data = [
        {
            'id': item.id,
            'nombre': item.nombre,
            'categoria': item.categoria,
            'precio_estimado': float(item.precio_estimado),
            'ubicacion': item.ubicacion,
            'fecha_adquisicion': item.fecha_adquisicion.iosformat(),
            'owner_id': item.owner_id
        }
        for item in item
    ]
    return jsonify(data), 200


@main.route('/items/<int:id>', methods=['GET'])
def listar_un_item(id):
    """
    Retorna un solo item por su ID (JSON).
    """
    item = Item.query.get_or_404(id)

    data = {
            'id': item.id,
            'nombre': item.nombre,
            'categoria': item.categoria,
            'precio_estimado': float(item.precio_estimado),
            'ubicacion': item.ubicacion,
            'fecha_adquisicion': item.fecha_adquisicion.isoformat(),
            'owner_id': item.owner_id
    }

    return jsonify(data), 200


@main.route('/items', methods=['POST'])
def crear_item():
    """
    Crea un item sin validación.
    Espera JSON con los campos del modelo Item.
    """
    data = request.get_json()

    if not data:
        return jsonify({'error': 'No input data provided'}), 400

    item = Item(
        nombre=data.get('nombre'),
        categoria=data.get('categoria'),
        cantidad=data.get('cantidad'),
        precio_estimado=data.get('precio_estimado'),
        ubicacion=data.get('ubicacion'),
        fecha_adquisicion=data.get('fecha_adquisicion'),
        owner_id=data.get('owner_id') # sin validación de usuario
    )

    db.session.add(item)
    db.session.commit()

    return jsonify({'message': 'Item creado', 'id': item.id}), 201

@main.route('/items/<int:id>', methods=['PUT'])
def actualizar_item(id):
    """
    Actualiza un item sin validación.
    """
    item = Item.query.get_or_404(id)
    data = request.get_json()

    item.nombre= data.get('nombre', item.nombre)
    item.categoria= data.get('categoria', item.categoria)
    item.cantidad= data.get('cantidad', item.cantidad)
    item.precio_estimado=data.get('precio_estimado', item.precio_estimado)
    item.ubicacion= data.get('ubicacion', item.ubicacion)
    item.fecha_adquisicion=data.get('fecha_adquisicion', item.fecha_adquisicion)
    item.owner_id=data.get('owner_id', item.owner_id)

    db.session.commit()

    return jsonify({'message': 'Item actualizado', 'id': item.id}), 200

@main.route('/items/<int:id>', methods=['DELETE'])
def eliminar_item(id):
    """
    Elimina un item sin validación.
    """
    item = Item.query.get_or_404(id)
    db.session.delete(item)
    db.session.commit()

    return jsonify({'message': 'Item eliminado', 'id': item.id}), 200
