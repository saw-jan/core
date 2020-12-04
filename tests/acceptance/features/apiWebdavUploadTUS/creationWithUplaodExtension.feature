@api @skipOnOcV10
Feature: tests of the creation extension see https://tus.io/protocols/resumable-upload.html#creation-with-upload

  Background:
    Given user "Alice" has been created with default attributes and without skeleton files

  Scenario Outline: creating a new upload resource using creation with upload extension
    Given using <dav_version> DAV path
    When user "Alice" creates a new TUS resource with content "uploaded content" to "/textfile.txt" on the WebDAV API with these headers:
      | Upload-Length | 100                             |
      | Tus-Resumable | 1.0.0                           |
      | Content-Type  | application/offset+octet-stream |
    Then as "Alice" file "/textfile.txt" should exist
    And the content of file "/textfile.txt" for user "Alice" should be "uploaded content"
    And the following headers should be set
      | header        | value |
      | Tus-Resumable | 1.0.0 |
    Examples:
      | dav_version |
      | old         |
      | new         |
