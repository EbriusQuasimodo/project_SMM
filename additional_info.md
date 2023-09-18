# Дополнительная документация к Smart103

----

## Enums

В программе используются численные перечисления для статусов вызовов и бригад.

### CallsStatuses

Ниже представлены численные эквиваленты статусов вызовов

1. Создан - **0**
2. В очереди - **1**
3. Ожидает выезда - **7**
4. Доезд - **2**
5. Обслуживание - **3**
6. На госпитализации - **4**
7. Прибытие в стационар (прибытие в место госпитализации) - **6**
8. На результате - **5**
9. В архиве - **20**
10. Отложен - **30**

### BrigadeStatuses

Ниже представлены численные эквиваленты статусов бригад

1. На ПС - **0**
2. Доезд - **1**
3. Обслуживание - **2**
4. Госпитализация - **3**
5. Возвращение на ПС - **4**
6. Обязательное возвращение на ПС - **5**
7. Обед - **6**
8. Заправка - **7**
9. Ремонт - **8**
10. Подготовка - **9**
11. Свободна (бригада на решении) - **10**
12. В стационаре - **11**
13. Ожидает выезда - **12**

## Работа с фильтрацией в приложении для глав. врача (sd_mobile)

В API для фильтрации вызовов и бригад используется понятие глобального фильтра.
Фильтрация выполняется путем отправки на API соответствующего ключа (ищи описание в SWAGGER).
Здесь будет представлено описание по работе с конкретными полями, их возможными операторами и значениями.

### CallsFilter

Ниже представлены возможные значения в ключе "field":

1. **status** - Фильтрует вызова по статусу. Для оператора возможны следующие значения:
    1. **in** - проверяет, что вызов находится в диапазоне некоторых статусов. Значения для ключа **value - массив int,
       где каждое значение - численный эквивалент статуса из CallsStatuses**
    2. **notIn** - проверяет, что вызов не находится в диапазоне некоторых статусов. Значения для ключа **value - массив
       int, где каждое значение - численный эквивалент статуса из CallsStatuses**
   ```json
   {
            "field": "status",
            "op": "in",
            "value": [1,2,3,4,5]
   }
   ```

2. **city_station** - Фильтрует вызова по городу. Для оператора возможны следующие значения:
    1. **in** - проверяет, что вызов находится в диапазоне некоторых городов. Значения для ключа **value - массив int,
       где
       каждое значение - id города**
    2. **notIn** - проверяет, что вызов не находится в диапазоне некоторых городов. Значения для ключа **value - массив
       int, где каждое значение - id города**
    ```json
   {
            "field": "city_station",
            "op": "in",
            "value": [1,2]
   }
   ```

3. **priority** - Фильтрует вызова по категории срочности. Для оператора возможны следующие значения:
    1. **in** - проверяет, что вызов находится в диапазоне некоторых категорий срочности. **Значения для ключа value -
       массив int, где каждое значение - 1,2,3 или 4**
    2. **notIn** - проверяет, что вызов не находится в диапазоне некоторых категорий срочности. **Значения для ключа
       value - массив int, где каждое значение - 1,2,3 или 4**
    ```json
   {
            "field": "priority",
            "op": "in",
            "value": [1,2,3,4]
   }
   ```

4. **substation** - Фильтрует вызова по подстанции. Для оператора возможны следующие значения:
    1. **in** - проверяет, что вызов находится в диапазоне подстанций. Значения для ключа **value - массив int, где
       каждое
       значение - id подстанции**
    2. **notIn** - проверяет, что вызов не находится в диапазоне подстанций. Значения для ключа **value - массив int,
       где
       каждое значение - id подстанции**
    ```json
   {
            "field": "substation",
            "op": "in",
            "value": [1,2]
   }
   ```

5. **day_number** - Фильтрует вызова по дневному номеру. Для оператора возможны следующие значения:
    1. **eq** - проверяет, что дневной номер вызова равен некоторому значению. Значения для ключа **value - int (искомый
       дневной номер)**
    ```json
   {
            "field": "day_number",
            "op": "eq",
            "value": 123
   }
   ```
6. **patient_fio** - Фильтрует вызова по фио пациента. Для оператора возможны следующие значения:
    1. **regexI** - проверяет, что фио пациента содержит искомую подстроку на любой позиции игнорируя регистр. Значения
       для ключа **value - string (искомая подстрока)**
    ```json
   {
            "field": "patient_fio",
            "op": "regexI",
            "value": "вАнОв"
   }
   ```
7. **street** - Фильтрует вызова по улице. Для оператора возможны следующие значения:
    1. **regexI** - проверяет, что улица содержит искомую подстроку на любой позиции игнорируя регистр. Значения для
       ключа **value - string (искомая подстрока)**
    ```json
   {
            "field": "street",
            "op": "regexI",
            "value": "ГоГоЛя"
   }
   ```

8. **house** - Фильтрует вызова по номеру дома. Для оператора возможны следующие значения:
    1. **eq** - проверяет, что дневной номер дома равен некоторому значению. Значения для ключа **value - string (
       искомый
       номер дома)**
    ```json
   {
            "field": "house",
            "op": "eq",
            "value": 123
   }
   ```

9. **apartment** - Фильтрует вызова по номеру квартиры. Для оператора возможны следующие значения:
    1. **eq** - проверяет, что дневной номер квартиры равен некоторому значению. Значения для ключа **value - string (
       искомый
       номер квартиры)**
    ```json
   {
            "field": "apartment",
            "op": "eq",
            "value": 123
   }
   ```

### BrigadesFilter

Ниже представлены возможные значения в ключе "field":

1. **status** - Фильтрует бригады по статусу. Для оператора возможны следующие значения:
    1. **in** - проверяет, что бригада находится в диапазоне некоторых статусов. Значения для ключа **value - массив
       int,
       где каждое значение - численный эквивалент статуса из BrigadeStatuses**
    2. **notIn** - проверяет, что бригада не находится в диапазоне некоторых статусов. Значения для ключа **value -
       массив
       int, где каждое значение - численный эквивалент статуса из BrigadeStatuses**
   ```json
   {
            "field": "status",
            "op": "in",
            "value": [1,2,3,4,5]
   }
   ```

2. **city_station** - Фильтрует бригады по городу. Для оператора возможны следующие значения:
    1. **in** - проверяет, что бригада находится в диапазоне некоторых городов. Значения для ключа **value - массив int,
       где
       каждое значение - id города**
    2. **notIn** - проверяет, что бригада не находится в диапазоне некоторых городов. Значения для ключа **value -
       массив
       int, где каждое значение - id города**
    ```json
   {
            "field": "city_station",
            "op": "in",
            "value": [1,2]
   }
   ```

3. **substation** - Фильтрует бригады по подстанции. Для оператора возможны следующие значения:
    1. **in** - проверяет, что бригада находится в диапазоне подстанций. Значения для ключа **value - массив int, где
       каждое
       значение - id подстанции**
    2. **notIn** - проверяет, что бригада не находится в диапазоне подстанций. Значения для ключа **value - массив int,
       где
       каждое значение - id подстанции**
    ```json
   {
            "field": "substation",
            "op": "in",
            "value": [1,2]
   }
   ```

4. **profile** - Фильтрует бригады по профилю. Для оператора возможны следующие значения:
    1. **in** - проверяет, что бригада находится в диапазоне профилей. Значения для ключа **value - массив int, где
       каждое
       значение - id профиля**
    2. **notIn** - проверяет, что бригада не находится в диапазоне профилей. Значения для ключа **value - массив int,
       где
       каждое значение - id профиля**
    ```json
   {
            "field": "profile",
            "op": "in",
            "value": [1,2]
   }
   ```

5. **number** - Фильтрует бригады по номеру. Для оператора возможны следующие значения:
    1. **eq** - проверяет, что номер бригады равен некоторому значению. Значения для ключа **value - string (искомый
       номер бригады)**
    ```json
   {
            "field": "number",
            "op": "eq",
            "value": 123
   }
   ```

## Reports

Для версии 1.0 мобильного приложения предусмотрено построение так называемого "дневного отчета" скорой помощи.
Для его реализации используется соответствующая API (смотри документацию в SWAGGER и раздел отчеты).
Для удобства разработчика ниже будет расписан формат данных и сопоставление полей отчета и структуры ответа сервера.

### Структура ответа сервера

Ниже представлен пример объекта на языке Go описывающего результат отчета.

```go
package main

type ReportField struct {
	Count   int     `json:"value"`
	Percent float64 `json:"percent"`
}

type reportData struct {
	All            int         `json:"all"`
	Repeats        ReportField `json:"repeats"`
	WithoutTransit ReportField `json:"without_transit"`
	WithoutResult  ReportField `json:"without_result"`

	WithTransit struct {
		All                ReportField `json:"all"`
		FirstThirdPriority ReportField `json:"first_third_priority"`
		FourthPriority     ReportField `json:"fourth_priority"`
		Other              ReportField `json:"other"`
	} `json:"with_transit"`

	FirstPriority struct {
		All        ReportField `json:"all"`
		Efficiency ReportField `json:"efficiency"`
	} `json:"first_priority"`

	SecondPriority struct {
		All        ReportField `json:"all"`
		Efficiency ReportField `json:"efficiency"`
	} `json:"second_priority"`

	ThirdPriority struct {
		All        ReportField `json:"all"`
		Efficiency ReportField `json:"efficiency"`
	} `json:"third_priority"`

	FourthPriority struct {
		All        ReportField `json:"all"`
		Efficiency ReportField `json:"efficiency"`
	} `json:"fourth_priority"`

	AvgHealTime struct {
		Value             float64 `json:"value"`
		PolyclinicValue   float64 `json:"polyclinic_value"`
		NoPolyclinicValue float64 `json:"no_polyclinic_value"`
	} `json:"avg_heal_time"`

	AvgArriveTime struct {
		Value             float64 `json:"value"`
		PolyclinicValue   float64 `json:"polyclinic_value"`
		NoPolyclinicValue float64 `json:"no_polyclinic_value"`
	} `json:"avg_arrive_time"`

	TransitToMoCalls struct {
		All             ReportField `json:"all"`
		Hospitalization ReportField `json:"hospitalization"`
		Help            ReportField `json:"help"`
		Other           ReportField `json:"other"`
	} `json:"transit_to_mo_calls"`

	Emergency ReportField `json:"emergency"`

	Lethal struct {
		All       ReportField `json:"all"`
		BeforeSMP ReportField `json:"before_smp"`
		AfterSMP  ReportField `json:"after_smp"`
	} `json:"lethal"`

	Reanimation struct {
		All     ReportField `json:"all"`
		Success ReportField `json:"success"`
		Failed  ReportField `json:"failed"`
	} `json:"reanimation"`

	Shock ReportField `json:"shock"`

	OKS struct {
		All         ReportField `json:"all"`
		WithUpST    ReportField `json:"with_up_st"`
		WithoutUpST ReportField `json:"without_up_st"`
	} `json:"oks"`

	ONMK struct {
		All     ReportField `json:"all"`
		Lt40min ReportField `json:"lt_40_min"`
		Gt40min ReportField `json:"gt_40_min"`
	} `json:"onmk"`

	Pregnancy struct {
		All                   ReportField `json:"all"`
		HospitalizationRefuse ReportField `json:"hospitalization_refuse"`
		Eclampsia             ReportField `json:"eclampsia"`
		Home                  ReportField `json:"home"`
	} `json:"pregnancy"`

	Orvi      ReportField `json:"orvi"`
	Infection ReportField `json:"infection"`
}

```

Отчет строится за две смены: текущую и прошедшую. Будем считать, что текущая смена это todayReportData, а прошедшая - yesterdayReportData.
Тогда таблица отчета будет выглядеть следующим образом:

| **Данные**                          | **Подпункт**                     | **Вчера**                                                  | **Вчера %**                                                  | **Сегодня**                                            | **Сегодня %**                                            |
|-------------------------------------|----------------------------------|------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------|----------------------------------------------------------|
| **_Обращений_**                     |                                  | yesterdayReportData.All                                    |                               -                              | todayReportData.All                                    |                             -                            |
| **_Повторные_**                     |                                  | yesterdayReportData.Repeats.Count                          | yesterdayReportData.Repeats.Percent                          | todayReportData.Repeats.Count                          | todayReportData.Repeats.Percent                          |
| **_Без выезда_**                    |                                  | yesterdayReportData.WithoutTransit.Count                   | yesterdayReportData.WithoutTransit.Percent                   | todayReportData.WithoutTransit.Count                   | todayReportData.WithoutTransit.Percent                   |
| **_Безрезультатных_**               |                                  | yesterdayReportData.WithoutResult.Count                    | yesterdayReportData.WithoutResult.Percent                    | todayReportData.WithoutResult.Count                    | todayReportData.WithoutResult.Percent                    |
| **_Всего выездов_**                 |                                  | yesterdayReportData.WithTransit.All.Count                  | yesterdayReportData.WithTransit.All.Percent                  | todayReportData.WithTransit.All.Count                  | todayReportData.WithTransit.All.Percent                  |
|                                     | **_1-3 срочность_**              | yesterdayReportData.WithTransit.FirstThirdPriority.Count   | yesterdayReportData.WithTransit.FirstThirdPriority.Percent   | todayReportData.WithTransit.FirstThirdPriority.Count   | todayReportData.WithTransit.FirstThirdPriority.Percent   |
|                                     | **_4 срочность_**                | yesterdayReportData.WithTransit.FourthPriority.Count       | yesterdayReportData.WithTransit.FourthPriority.Percent       | todayReportData.WithTransit.FourthPriority.Count       | todayReportData.WithTransit.FourthPriority.Percent       |
|                                     | **_Другое_**                     | yesterdayReportData.WithTransit.Other.Count                | yesterdayReportData.WithTransit.Other.Percent                | todayReportData.WithTransit.Other.Count                | todayReportData.WithTransit.Other.Percent                |
| **_1 срочность_**                   |                                  | yesterdayReportData.FirstPriority.All.Count                | yesterdayReportData.FirstPriority.All.Percent                | todayReportData.FirstPriority.All.Count                | todayReportData.FirstPriority.All.Percent                |
|                                     | **_Оперативность_**              | yesterdayReportData.FirstPriority.Efficiency.Count         | yesterdayReportData.FirstPriority.Efficiency.Percent         | todayReportData.FirstPriority.Efficiency.Count         | todayReportData.FirstPriority.Efficiency.Percent         |
| **_2 срочность_**                   |                                  | yesterdayReportData.SecondPriority.All.Count               | yesterdayReportData.SecondPriority.All.Percent               | todayReportData.SecondPriority.All.Count               | todayReportData.SecondPriority.All.Percent               |
|                                     | **_Оперативность_**              | yesterdayReportData.SecondPriority.Efficiency.Count        | yesterdayReportData.SecondPriority.Efficiency.Percent        | todayReportData.SecondPriority.Efficiency.Count        | todayReportData.SecondPriority.Efficiency.Percent        |
| **_3 срочность_**                   |                                  | yesterdayReportData.ThirdPriority.All.Count                | yesterdayReportData.ThirdPriority.All.Percent                | todayReportData.ThirdPriority.All.Count                | todayReportData.ThirdPriority.All.Percent                |
|                                     | **_Оперативность_**              | yesterdayReportData.ThirdPriority.Efficiency.Count         | yesterdayReportData.ThirdPriority.Efficiency.Percent         | todayReportData.ThirdPriority.Efficiency.Count         | todayReportData.ThirdPriority.Efficiency.Percent         |
| **_4 срочность_**                   |                                  | yesterdayReportData.FourthPriority.All.Count               | yesterdayReportData.FourthPriority.All.Percent               | todayReportData.FourthPriority.All.Count               | todayReportData.FourthPriority.All.Percent               |
|                                     | **_Оперативность_**              | yesterdayReportData.FourthPriority.Efficiency.Count        | yesterdayReportData.FourthPriority.Efficiency.Percent        | todayReportData.FourthPriority.Efficiency.Count        | todayReportData.FourthPriority.Efficiency.Percent        |
| **_Среднее время оказания помощи_** |                                  | yesterdayReportData.AvgHealTime.Value                      |                               -                              | todayReportData.AvgHealTime.Value                      |                             -                            |
|                                     | **_ОССМП_**                      | yesterdayReportData.AvgHealTime.PolyclinicValue            |                               -                              | todayReportData.AvgHealTime.PolyclinicValue            |                             -                            |
|                                     | **_СМП при ПМСП_**               | yesterdayReportData.AvgHealTime.NoPolyclinicValue          |                               -                              | todayReportData.AvgHealTime.NoPolyclinicValue          |                             -                            |
| **_Среднее время доезда_**          |                                  | yesterdayReportData.AvgArriveTime.Value                    |                               -                              | todayReportData.AvgArriveTime.Value                    |                             -                            |
|                                     | **_ОССМП_**                      | yesterdayReportData.AvgArriveTime.PolyclinicValue          |                               -                              | todayReportData.AvgArriveTime.PolyclinicValue          |                             -                            |
|                                     | **_СМП при ПМСП_**               | yesterdayReportData.AvgArriveTime.NoPolyclinicValue        |                               -                              | todayReportData.AvgArriveTime.NoPolyclinicValue        |                             -                            |
| **_Доставлены в МО_**               |                                  | yesterdayReportData.TransitToMoCalls.All.Count             | yesterdayReportData.TransitToMoCalls.All.Percent             | todayReportData.TransitToMoCalls.All.Count             | todayReportData.TransitToMoCalls.All.Percent             |
|                                     | **_на госпитализацию _**         | yesterdayReportData.TransitToMoCalls.Hospitalization.Count | yesterdayReportData.TransitToMoCalls.Hospitalization.Percent | todayReportData.TransitToMoCalls.Hospitalization.Count | todayReportData.TransitToMoCalls.Hospitalization.Percent |
|                                     | **_для оказания помощи_**        | yesterdayReportData.TransitToMoCalls.Help.Count            | yesterdayReportData.TransitToMoCalls.Help.Percent            | todayReportData.TransitToMoCalls.Help.Count            | todayReportData.TransitToMoCalls.Help.Percent            |
|                                     | **_Прочие_**                     | yesterdayReportData.TransitToMoCalls.Other.Count           | yesterdayReportData.TransitToMoCalls.Other.Percent           | todayReportData.TransitToMoCalls.Other.Count           | todayReportData.TransitToMoCalls.Other.Percent           |
| **_Вызова по ЧС_**                  |                                  | yesterdayReportData.Emergency.Count                        | yesterdayReportData.Emergency.Percent                        | todayReportData.Emergency.Count                        | todayReportData.Emergency.Percent                        |
| **_Летальность_**                   |                                  | yesterdayReportData.Lethal.All.Count                       | yesterdayReportData.Lethal.All.Percent                       | todayReportData.Lethal.All.Count                       | todayReportData.Lethal.All.Percent                       |
|                                     | **_до СМП_**                     | yesterdayReportData.Lethal.BeforeSMP.Count                 | yesterdayReportData.Lethal.BeforeSMP.Percent                 | todayReportData.Lethal.BeforeSMP.Count                 | todayReportData.Lethal.BeforeSMP.Percent                 |
|                                     | **_При СМП/В машине СМП_**       | yesterdayReportData.Lethal.AfterSMP.Count                  | yesterdayReportData.Lethal.AfterSMP.Percent                  | todayReportData.Lethal.AfterSMP.Count                  | todayReportData.Lethal.AfterSMP.Percent                  |
| **_Реанимация_**                    |                                  | yesterdayReportData.Reanimation.All.Count                  | yesterdayReportData.Reanimation.All.Percent                  | todayReportData.Reanimation.All.Count                  | todayReportData.Reanimation.All.Percent                  |
|                                     | **_успешная_**                   | yesterdayReportData.Reanimation.Success.Count              | yesterdayReportData.Reanimation.Success.Percent              | todayReportData.Reanimation.Success.Count              | todayReportData.Reanimation.Success.Percent              |
|                                     | **_безуспешная_**                | yesterdayReportData.Reanimation.Failed.Count               | yesterdayReportData.Reanimation.Failed.Percent               | todayReportData.Reanimation.Failed.Count               | todayReportData.Reanimation.Failed.Percent               |
| **_ШОКИ_**                          |                                  | yesterdayReportData.Shock.Count                            | yesterdayReportData.Shock.Percent                            | todayReportData.Shock.Count                            | todayReportData.Shock.Percent                            |
| **_ОКС_**                           |                                  | yesterdayReportData.OKS.All.Count                          | yesterdayReportData.OKS.All.Percent                          | todayReportData.OKS.All.Count                          | todayReportData.OKS.All.Percent                          |
|                                     | **_с подъёмом ST_**              | yesterdayReportData.OKS.WithUpST.Count                     | yesterdayReportData.OKS.WithUpST.Percent                     | todayReportData.OKS.WithUpST.Count                     | todayReportData.OKS.WithUpST.Percent                     |
|                                     | **_без подъёмома ST_**           | yesterdayReportData.OKS.WithoutUpST.Count                  | yesterdayReportData.OKS.WithoutUpST.Percent                  | todayReportData.OKS.WithoutUpST.Count                  | todayReportData.OKS.WithoutUpST.Percent                  |
| **_ОНМК_**                          |                                  | yesterdayReportData.ONMK.All.Count                         | yesterdayReportData.ONMK.All.Percent                         | todayReportData.ONMK.All.Count                         | todayReportData.ONMK.All.Percent                         |
|                                     | **_в течении 40 минут_**         | yesterdayReportData.ONMK.Lt40min.Count                     | yesterdayReportData.ONMK.Lt40min.Percent                     | todayReportData.ONMK.Lt40min.Count                     | todayReportData.ONMK.Lt40min.Percent                     |
|                                     | **_более 40 минут_**             | yesterdayReportData.ONMK.Gt40min.Count                     | yesterdayReportData.ONMK.Gt40min.Percent                     | todayReportData.ONMK.Gt40min.Count                     | todayReportData.ONMK.Gt40min.Percent                     |
| **_Беременные_**                    |                                  | yesterdayReportData.Pregnancy.All.Count                    | yesterdayReportData.Pregnancy.All.Percent                    | todayReportData.Pregnancy.All.Count                    | todayReportData.Pregnancy.All.Percent                    |
|                                     | **_отказ от госпитализации_**    | yesterdayReportData.Pregnancy.HospitalizationRefuse.Count  | yesterdayReportData.Pregnancy.HospitalizationRefuse.Percent  | todayReportData.Pregnancy.HospitalizationRefuse.Count  | todayReportData.Pregnancy.HospitalizationRefuse.Percent  |
|                                     | **_Преэклампсии или эклампсии_** | yesterdayReportData.Pregnancy.Eclampsia.Count              | yesterdayReportData.Pregnancy.Eclampsia.Percent              | todayReportData.Pregnancy.Eclampsia.Count              | todayReportData.Pregnancy.Eclampsia.Percent              |
|                                     | **_домашние/дорожные роды_**     | yesterdayReportData.Pregnancy.Home.Count                   | yesterdayReportData.Pregnancy.Home.Percent                   | todayReportData.Pregnancy.Home.Count                   | todayReportData.Pregnancy.Home.Percent                   |
| **_ОРВИ/пневмонии_**                |                                  | yesterdayReportData.Orvi.Count                             | yesterdayReportData.Orvi.Percent                             | todayReportData.Orvi.Count                             | todayReportData.Orvi.Percent                             |
| **_Инфекции_**                      |                                  | yesterdayReportData.Infection.Count                        | yesterdayReportData.Infection.Percent                        | todayReportData.Infection.Count                        | todayReportData.Infection.Percent                        |