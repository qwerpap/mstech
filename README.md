# mstech — short project overview

This README summarises architecture, project layout, key design decisions and suggested improvements.

Architecture
- Clean Architecture-ish layering: presentation → domain → data.
  - Presentation: Cubits / UI (features/*/view + bloc).
  - Domain: usecases (features/*/domain).
  - Data: repositories (features/*/data) wrapping persistence/services.
- DI: GetIt centralised in `lib/core/bloc/bloc_providers.dart`.
- State: flutter_bloc (Cubit) for business logic and reactive UI.
- Persistence: SharedPreferences wrapped by `LocalStorageService` (`lib/core/services/local_storage_service.dart`).
- Navigation: go_router with a central `createAppRouter` (`lib/core/navigation/presentation/app_router.dart`).

Project structure (high level)
- lib/
  - core/
    - bloc/ (DI & providers)
    - navigation/ (router + bottom nav)
    - services/ (LocalStorageService)
    - shared/widgets (reusable UI)
    - theme (tokens: colors, spacing, fonts)
  - features/
    - onboarding/ (view, cubit, data)
    - home/ (view, cubit, widgets)
    - paywall/ (view, bloc, data, domain)
    - auth/ (login state, repo/usecases)
    - profile/, favourites/, notifications/ (views)
  - main.dart (bootstrap: DI + router)

User flows / minimal UX logic
- Onboarding: 3 pages; Skip or Get Started marks user logged-in and navigates to Home.
- Paywall: two plans; "Start Free Trial" simulates purchase, persists subscription, closes Paywall and returns Home; Home updates via PaywallCubit.
- Profile / other screens: show live subscription status and allow unsubscribe and logout. Logout clears login flag — next app start shows Onboarding.

What was refactored / decisions taken
- Introduced `LocalStorageService` to centralise SharedPreferences access and improve testability.
- Repositories (data) now use the service; usecases wrap repository calls; cubits call usecases — better separation.
- Registered repositories/usecases/cubits in GetIt for single source of truth and easy mocking.
- Kept UI unchanged where possible; reused widgets across features.

Improvements to make with more time (prioritised)
1. Add interfaces (abstract classes) for repositories and inject them — enables easier unit testing with mocks.
2. Add unit tests for usecases and cubits (mock LocalStorageService).
3. Add widget / integration tests for critical flows (onboarding → home, paywall).
4. Replace local subscription persistence with server-side receipt validation for production billing.
5. CI pipeline: lint, format, test runs on PRs.

How we evaluate this work
- Clear reasoning and tradeoffs in decisions.
- Fast adaptation and independent problem solving.
- Initiative — improvements beyond initial scope.
- Code structure and cleanliness (consistent tokens, const usage, minimal rebuilds).
- Logical UI/UX (flows working end-to-end even with minimal design).

If you want next:
- I can add abstract repository interfaces + 2 unit tests for PaywallCubit (mocking LocalStorageService).
- Or create CI job templates (GitHub Actions) for lint + test runs.
