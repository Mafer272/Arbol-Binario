class Empleado {
  int id;
  String nombre;

  Empleado(this.id, this.nombre);
}

class Nodo {
  Empleado empleado;
  Nodo? izquierdo;
  Nodo? derecho;

  Nodo(this.empleado);
}

class ArbolBinario {
  Nodo? raiz;

  void insertar(int id, String nombre) {
    raiz = _insertarRec(raiz, Empleado(id, nombre));
  }

  Nodo _insertarRec(Nodo? nodo, Empleado empleado) {
    if (nodo == null) {
      return Nodo(empleado);
    }

    if (empleado.id < nodo.empleado.id) {
      nodo.izquierdo = _insertarRec(nodo.izquierdo, empleado);
    } else {
      nodo.derecho = _insertarRec(nodo.derecho, empleado);
    }
    return nodo;
  }

  void preorden() {
    _preordenRec(raiz);
    print('');
  }

  void _preordenRec(Nodo? nodo) {
    if (nodo != null) {
      print('${nodo.empleado.id}: ${nodo.empleado.nombre}');
      _preordenRec(nodo.izquierdo);
      _preordenRec(nodo.derecho);
    }
  }

  void inorden() {
    _inordenRec(raiz);
    print('');
  }

  void _inordenRec(Nodo? nodo) {
    if (nodo != null) {
      _inordenRec(nodo.izquierdo);
      print('${nodo.empleado.id}: ${nodo.empleado.nombre}');
      _inordenRec(nodo.derecho);
    }
  }

  void postorden() {
    _postordenRec(raiz);
    print('');
  }

  void _postordenRec(Nodo? nodo) {
    if (nodo != null) {
      _postordenRec(nodo.izquierdo);
      _postordenRec(nodo.derecho);
      print('${nodo.empleado.id}: ${nodo.empleado.nombre}');
    }
  }
}

void main() {
  ArbolBinario arbol = ArbolBinario();
  arbol.insertar(50, "Director General");
  arbol.insertar(30, "Gerente de Ventas");
  arbol.insertar(70, "Gerente de Tecnologia");
  arbol.insertar(20, "Supervisor de Ventas");
  arbol.insertar(40, "Ejecutivo de Cuentas");
  arbol.insertar(60, "Lider de Desarrollo");
  arbol.insertar(80, "Arquitecto de Software");

  print("Recorrido Preorden:");
  arbol.preorden();

  print("Recorrido Inorden:");
  arbol.inorden();

  print("Recorrido Postorden:");
  arbol.postorden();
}
