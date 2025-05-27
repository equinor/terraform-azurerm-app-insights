# Changelog

## [5.3.3](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.3.2...v5.3.3) (2025-05-27)


### Code Refactoring

* move Smart Detector alert rules to separate resources ([#58](https://github.com/equinor/terraform-azurerm-app-insights/issues/58)) ([f2bd7bc](https://github.com/equinor/terraform-azurerm-app-insights/commit/f2bd7bc05fe36b3dcd99d60c59ab6e08e3b296e1))

## [5.3.2](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.3.1...v5.3.2) (2025-04-25)


### Documentation

* add missing prereq to README ([4fd8d18](https://github.com/equinor/terraform-azurerm-app-insights/commit/4fd8d18a13ef9367a8f94a38f8343e1afa90cf07))

## [5.3.1](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.3.0...v5.3.1) (2025-04-24)


### Documentation

* update README ([e8e2905](https://github.com/equinor/terraform-azurerm-app-insights/commit/e8e2905789bfde9b9fb8c4d102a4f8246c1e2c0d))

## [5.3.0](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.2.3...v5.3.0) (2025-01-31)


### Features

* create sampling precentage variable ([#56](https://github.com/equinor/terraform-azurerm-app-insights/issues/56)) ([5c76d1b](https://github.com/equinor/terraform-azurerm-app-insights/commit/5c76d1b40155a45487954127e91773d682790800))

## [5.2.3](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.2.2...v5.2.3) (2024-10-23)


### Code Refactoring

* clarify alert rule name variable descriptions ([#54](https://github.com/equinor/terraform-azurerm-app-insights/issues/54)) ([c24cc36](https://github.com/equinor/terraform-azurerm-app-insights/commit/c24cc36077f02ff926c2b7f2a22c9390eb04f51f))

## [5.2.2](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.2.1...v5.2.2) (2024-10-21)


### Bug Fixes

* bump required AzAPI provider version ([#52](https://github.com/equinor/terraform-azurerm-app-insights/issues/52)) ([12795f7](https://github.com/equinor/terraform-azurerm-app-insights/commit/12795f78c447ca83cf25fa09c5a25ab96f58a093))
* using module with AzAPI provider v2 throws error ([#50](https://github.com/equinor/terraform-azurerm-app-insights/issues/50)) ([83cd517](https://github.com/equinor/terraform-azurerm-app-insights/commit/83cd5178ac65f2017451a92728334a0d3fe56b01))

## [5.2.1](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.2.0...v5.2.1) (2024-08-27)


### Documentation

* add features list to README ([#48](https://github.com/equinor/terraform-azurerm-app-insights/issues/48)) ([ac2046f](https://github.com/equinor/terraform-azurerm-app-insights/commit/ac2046f9fd30098cbae8ba175e0206c9ee6602c5))

## [5.2.0](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.1.0...v5.2.0) (2024-05-13)


### Features

* disable local authentication by default ([#43](https://github.com/equinor/terraform-azurerm-app-insights/issues/43)) ([c527da7](https://github.com/equinor/terraform-azurerm-app-insights/commit/c527da71872b49225c5b18ea68bd790fd389dff8))

## [5.1.0](https://github.com/equinor/terraform-azurerm-app-insights/compare/v5.0.0...v5.1.0) (2024-03-07)


### Features

* set smart detector alert rule names ([#38](https://github.com/equinor/terraform-azurerm-app-insights/issues/38)) ([55b86c4](https://github.com/equinor/terraform-azurerm-app-insights/commit/55b86c42bf4dc352db312ff46a62699b7cffe9fc))

## [5.0.0](https://github.com/equinor/terraform-azurerm-app-insights/compare/v4.0.0...v5.0.0) (2023-08-21)


### ⚠ BREAKING CHANGES

* don't create web tests ([#22](https://github.com/equinor/terraform-azurerm-app-insights/issues/22))

### Features

* don't create web tests ([#22](https://github.com/equinor/terraform-azurerm-app-insights/issues/22)) ([50a4315](https://github.com/equinor/terraform-azurerm-app-insights/commit/50a431510b1483b6bad82a10fe15fc1fca37061e))

## [4.0.0](https://github.com/equinor/terraform-azurerm-app-insights/compare/v3.2.0...v4.0.0) (2023-07-10)


### ⚠ BREAKING CHANGES

* remove variable `smart_detection_rules` and add variable `action_group_id`.

### Features

* migrate from smart detection rules to alert rules ([#19](https://github.com/equinor/terraform-azurerm-app-insights/issues/19)) ([b634f80](https://github.com/equinor/terraform-azurerm-app-insights/commit/b634f80a504aec1c8236aefe03370a6a91ff79db)), closes [#17](https://github.com/equinor/terraform-azurerm-app-insights/issues/17)

## [3.2.0](https://github.com/equinor/terraform-azurerm-app-insights/compare/v3.1.0...v3.2.0) (2023-05-03)


### Features

* configure smart detection rules ([#15](https://github.com/equinor/terraform-azurerm-app-insights/issues/15)) ([8ca3422](https://github.com/equinor/terraform-azurerm-app-insights/commit/8ca34229484f08e77c18860b8a9f96ed5c8a8d79))

## [3.1.0](https://github.com/equinor/terraform-azurerm-app-insights/compare/v3.0.0...v3.1.0) (2023-04-19)


### Features

* add web test submodule ([#12](https://github.com/equinor/terraform-azurerm-app-insights/issues/12)) ([62764ea](https://github.com/equinor/terraform-azurerm-app-insights/commit/62764eace0c17b8bacc53791e0d77159fc7db1a1))

## [3.0.0](https://github.com/equinor/terraform-azurerm-app-insights/compare/v2.0.0...v3.0.0) (2023-01-27)


### ⚠ BREAKING CHANGES

* create single componenet ([#9](https://github.com/equinor/terraform-azurerm-app-insights/issues/9))

### Features

* create single componenet ([#9](https://github.com/equinor/terraform-azurerm-app-insights/issues/9)) ([2ed5f04](https://github.com/equinor/terraform-azurerm-app-insights/commit/2ed5f041b1c2aa6acc9e20ccf6fb79a9ea0f5cd3))
