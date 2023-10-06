class BrigadesStatuses {
  final int onPS = 0;
  final int arrival = 1;
  final int service = 2;
  final int hospitalization = 3;
  final int returnToPS = 4;
  final int mandatoryReturnToPS = 5;
  final int lunch = 6;
  final int refueling = 7;
  final int repair = 8;
  final int preparation = 9;
  final int brigadeIsFree = 10;
  final int inHospital = 11;
  final int waitingDeparture = 12;
}

// 1. На ПС - **0**
// 2. Доезд - **1**
// 3. Обслуживание - **2**
// 4. Госпитализация - **3**
// 5. Возвращение на ПС - **4**
// 6. Обязательное возвращение на ПС - **5**
// 7. Обед - **6**
// 8. Заправка - **7**
// 9. Ремонт - **8**
// 10. Подготовка - **9**
// 11. Свободна (бригада на решении) - **10**
// 12. В стационаре - **11**
// 13. Ожидает выезда - **12**
