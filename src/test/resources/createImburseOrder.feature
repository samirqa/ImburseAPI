#Author: sameer21uk@gmial.com
#Keywords Summary : API
Feature: Test OrderCreation API

  Background: Generate AccessToken
    Given with the endpoint "/order-management" generate the AccessToken

  Scenario: Order created successfully with valid Order reference contain (.dot) -(dash) _(underscore)
    When send valid order reference without instruction
    Then response status should be 201

  Scenario: Validate Order creation with invalid order reference
    #  Given the endpoint "/order-management" exists and accessToken is granted
    When send order reference name "!abcd_dawdf_daw-wda="
    Then response status should be 400
    And the error response will show "ORDER_REF_CONTAINS_INVALID_CHARACTERS"
    
    When send order reference name "abcdefgafevnsrnvsejvjeanfanwfjanwndakwndkanwdwandawda"
    Then response status should be 400
    And the error response will show "ORDER_REF_LENGTH_OUT_OF_RANGE"
    
    When send order reference name "ad555%kwndkanwdwandawda"
    Then response status should be 400
    And the error response will show "ORDER_REF_CONTAINS_INVALID_CHARACTERS"
    
    When send order reference name ""
    Then response status should be 400
    And the error response will show "ORDER_REF_IS_REQUIRED"
#
  Scenario: Validate Order creation with unique Order reference
    # Given the endpoint "/order-management" exists and accessToken is granted
    When send order reference name "validOrderRef"
    When send order reference name "validOrderRef"
    Then response status should be 400
    And the error response will show "ORDER_ALREADY_EXISTS"
#
  Scenario: Metadata key is too long
    # Given the endpoint "/order-management" exists and accessToken is granted
    When creating an order with metadata "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa":"a","dd":"c","cg":"c"
    Then response status should be 400
#
  Scenario: Metadata key is empty
    #Given the endpoint "/order-management" exists and accessToken is granted
    When creating an order with metadata "aa":"b","cd":"c","":"c"
    Then response status should be 400
#
  #Not working, API allows > 100 chars for value?
  Scenario: Metadata value is too long
    #   Given the endpoint "/order-management" exists and accessToken is granted
    When creating an order with metadata "aa":"b","cd":"c","aac":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    Then response status should be 400
#
  #Not working, API accepts duplicated keys?
  Scenario: Metadata key is duplicated
    #   Given the endpoint "/order-management" exists and accessToken is granted
    When creating an order with metadata "aa":"cd","aa":"a","aa":"lhm"
    Then response status should be 400
#
  Scenario: Metadata is valid
    #  Given the endpoint "/order-management" exists and accessToken is granted
    When creating an order with metadata "aa":"a","hh":"c","cfg":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    Then response status should be 201
