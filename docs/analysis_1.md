# SetupSystem (0x02004A14)

- **ctrl** (r0): valor inicial del registro de control CP15.
- **cache clean loop:** si `(ctrl & 4)`, limpia la D‑cache por índices y offsets.
- **Data Synchronization:** `coproc_moveto_Data_Synchronization(0)`.
- **Actualización CP15:**  
  - Limpia bits con `CP15_CTRL_CLR_MASK`.  
  - Ajusta bits con `CP15_CTRL_SET_MASK`.  
- **Configuración TCM:** `CP15_TCM_ENABLE_MASK | 10`.  
- **Retorno:** nuevo valor de `ctrl` tras la configuración.

**Constantes:**

- `CP15_CTRL_CLR_MASK` (0x02004A8C): máscara de bits a 0 en CP15.
- `CP15_CTRL_SET_MASK` (0x02004A90): bits a poner a 1.
- `CP15_TCM_ENABLE_MASK` (0x02004A94): habilita TCM.

## LoadOverlays

- **bankIndex**: índice de banco de overlay.
- **tableEntries**: puntero a la tabla en RAM.
- **count**: número de entradas en la tabla.
- **Función**: escribe `bankIndex` en cada posición de la tabla.

### SetupSystem

- Limpia caché de datos (por índices y offsets).
- Sincroniza datos con `Data Synchronization`.
- Ajusta el registro de control del CP15 (ARM9).
- Opciones avanzadas de coprocessor.
