class CallStatuses {
  final int created = 0;
  final int inQueue = 1;
  final int waitingDeparture = 7;
  final int arrival = 2;
  final int service = 3;
  final int onHospitalization = 4;
  final int arrivalAtHospital = 6;
  final int onResult = 5;
  final int inArchive = 20;
  final int postponed = 30;
  final int transit = 2;
}

// 1. Создан - **0**
// 2. В очереди - **1**
// 3. Ожидает выезда - **7**
// 4. Доезд - **2**
// 5. Обслуживание - **3**
// 6. На госпитализации - **4**
// 7. Прибытие в стационар (прибытие в место госпитализации) - **6**
// 8. На результате - **5**
// 9. В архиве - **20**
// 10. Отложен - **30**
