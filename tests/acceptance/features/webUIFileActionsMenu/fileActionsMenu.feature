@webUI @insulated @disablePreviews @richdocuments-app-required @files_texteditor-app-required
Feature: File actions menu

  Background:
    Given these users have been created with skeleton files:
      | username |
      | Alice    |
    And user "Alice" has logged in using the webUI
    And the user has browsed to the files page

  Scenario: show the file actions application select menu with both Collabora and the Files Texteditor
    Given user "Alice" has uploaded file "filesForUpload/lorem.txt" to "/lorem.txt"
    When the user clicks on the file "lorem.txt"
    Then the file actions application select menu should be displayed with these items on the webUI
      | Open in Text Editor | Open in Collabora |

  Scenario: show the actions for Collabora and the Files Texteditor in the file action menu
    Given user "Alice" has uploaded file "filesForUpload/lorem.txt" to "/lorem.txt"
    And the user opens the file action menu of file "lorem.txt" on the webUI
    Then the file actions menu should be displayed with these items on the webUI
      | Open in Text Editor | Open in Collabora |
