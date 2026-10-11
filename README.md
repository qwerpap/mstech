# mstech — short project overview
 # mstech — краткое описание проекта

Коротко: это Flutter-приложение с простым онбордингом, фичей подписки (paywall) и главным экраном (home). Основная цель — демонстрация архитектурного подхода и рабочих пользовательских потоков.

Архитектура
- Структура в духе Clean Architecture: presentation → domain → data.
  - presentation: UI + Cubit/Bloc, файлы в `features/*/view` и `features/*/bloc`.
  - domain: usecases — бизнес-операции (`features/*/domain`).
  - data: репозитории, обёртки для локального хранения (`features/*/data`).
- DI: `GetIt` (центральная регистрация в `lib/core/bloc/bloc_providers.dart`).
- State management: `flutter_bloc` (Cubit) — реактивный UI.
- Локальное хранилище: `LocalStorageService` (обёртка над SharedPreferences) в `lib/core/services`.
- Навигация: `go_router` через `createAppRouter` (`lib/core/navigation/presentation/app_router.dart`).

Структура проекта (основное)
- `lib/core/` — DI, навигация, общие сервисы, shared-виджеты, тема.
- `lib/features/` — фичи по папкам:
  - `onboarding` — онбординг + cubit.
  - `paywall` — UI, репозиторий, usecases, cubit.
  - `auth` — хранение статуса входа (repo, usecase, cubit).
  - `home`, `profile`, `favourites`, `notifications` — экраны и виджеты.
- `lib/main.dart` — bootstrap: инициализация DI, выбор начального роутера.

Коротко о пользовательских потоках
- Пользователь видит онбординг (3 экрана). Skip или Get Started помечают пользователя как вошедшего и переводят на Home.
- Paywall: имитация покупки; при "Start Free Trial" подписка сохраняется, Paywall закрывается и Home обновляется через singleton PaywallCubit.
- Profile/Favourites/Notifications: показывают текущий статус подписки в реальном времени; доступны кнопки "Удалить подписку" и "Выйти с аккаунта" (logout сбрасывает флаг logged-in).

Что улучшено (в работе)
- Вынесено взаимодействие с SharedPreferences в `LocalStorageService` — упрощает тестирование и замену слоя хранения.
- Репозитории используют сервис хранения; usecases инкапсулируют операции; cubits опираются на usecases — чёткая разделённость ответственности.
- DI (GetIt) предоставляет репозитории, usecases и cubits как singleton/фабрики для консистентного состояния.

Дальнейшие улучшения при наличии времени
1. Ввести интерфейсы (abstract) для репозиториев и покрыть usecases/cubits unit-тестами (моки `LocalStorageService`).  
2. Добавить widget/integration тесты критичных сценариев.  
3. Интегрировать серверную проверку подписок (receipt validation) для продакшн-валидации.  
4. Настроить CI (lint, format, test) и pre-commit hooks.

Если нужно — могу сразу добавить примеры unit-тестов для `PaywallCubit` и шаблон CI.
