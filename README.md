# Secret Diary

This project was completed as part of the Encapsulation and Cohesion practical at Makers.

I started with the following specification:

```
SecretDiary
  - lock
  - unlock
  - add_entry
  - get_entries

Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.

When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

When the user locks the diary, by calling `lock`, `add_entry` and `get_entries` should, again, throw an error.
```

I used test-driven development to implement all functionality in one class: SecretDiary.

Afterwards, to improve the cohesion of this class, I extracted the locking functionality into a separate Lock class, and updated the tests accordingly.

I also used SimpleCov to check my test coverage.
