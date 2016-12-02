# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.3.0](https://github.com/everypolitician/field_serializer/compare/v0.2.0...v0.3.0) - 2016-12-02

### Added

- There is now a proper README with some basic documentation.

### Fixed

- Inheritance now works as expected. Previously subclasses weren't getting the
  fields from the parent class. [#7](https://github.com/everypolitician/field_serializer/pull/7).

## [0.2.0](https://github.com/everypolitician/field_serializer/compare/v0.1.0...v0.2.0) - 2016-10-28

### Changed

- There is now a hard requirement for Ruby >= 2.1. This is because we're using
  required keyword arguments, which were introduced in Ruby 2.1.
- Fields are now defined as methods behind the scenes. This means you can call
  them like normal methods from other fields.

## 0.1.0 - 2016-09-28

- Initial release
