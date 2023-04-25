// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String CardNumberValueKey = 'cardNumber';
const String CardOwnerValueKey = 'cardOwner';
const String CardExpiryValueKey = 'cardExpiry';
const String CardCvvValueKey = 'cardCvv';

final Map<String, TextEditingController>
    _PaymentCaptureViewTextEditingControllers = {};

final Map<String, FocusNode> _PaymentCaptureViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _PaymentCaptureViewTextValidations = {
  CardNumberValueKey: null,
  CardOwnerValueKey: null,
  CardExpiryValueKey: null,
  CardCvvValueKey: null,
};

mixin $PaymentCaptureView {
  TextEditingController get cardNumberController =>
      _getFormTextEditingController(CardNumberValueKey);
  TextEditingController get cardOwnerController =>
      _getFormTextEditingController(CardOwnerValueKey);
  TextEditingController get cardExpiryController =>
      _getFormTextEditingController(CardExpiryValueKey);
  TextEditingController get cardCvvController =>
      _getFormTextEditingController(CardCvvValueKey);
  FocusNode get cardNumberFocusNode => _getFormFocusNode(CardNumberValueKey);
  FocusNode get cardOwnerFocusNode => _getFormFocusNode(CardOwnerValueKey);
  FocusNode get cardExpiryFocusNode => _getFormFocusNode(CardExpiryValueKey);
  FocusNode get cardCvvFocusNode => _getFormFocusNode(CardCvvValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_PaymentCaptureViewTextEditingControllers.containsKey(key)) {
      return _PaymentCaptureViewTextEditingControllers[key]!;
    }

    _PaymentCaptureViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _PaymentCaptureViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_PaymentCaptureViewFocusNodes.containsKey(key)) {
      return _PaymentCaptureViewFocusNodes[key]!;
    }
    _PaymentCaptureViewFocusNodes[key] = FocusNode();
    return _PaymentCaptureViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    cardNumberController.addListener(() => _updateFormData(model));
    cardOwnerController.addListener(() => _updateFormData(model));
    cardExpiryController.addListener(() => _updateFormData(model));
    cardCvvController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    cardNumberController.addListener(() => _updateFormData(model));
    cardOwnerController.addListener(() => _updateFormData(model));
    cardExpiryController.addListener(() => _updateFormData(model));
    cardCvvController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CardNumberValueKey: cardNumberController.text,
          CardOwnerValueKey: cardOwnerController.text,
          CardExpiryValueKey: cardExpiryController.text,
          CardCvvValueKey: cardCvvController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _PaymentCaptureViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _PaymentCaptureViewFocusNodes.values) {
      focusNode.dispose();
    }

    _PaymentCaptureViewTextEditingControllers.clear();
    _PaymentCaptureViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get cardNumberValue =>
      this.formValueMap[CardNumberValueKey] as String?;
  String? get cardOwnerValue => this.formValueMap[CardOwnerValueKey] as String?;
  String? get cardExpiryValue =>
      this.formValueMap[CardExpiryValueKey] as String?;
  String? get cardCvvValue => this.formValueMap[CardCvvValueKey] as String?;

  set cardNumberValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          CardNumberValueKey: value,
        }),
    );

    if (_PaymentCaptureViewTextEditingControllers.containsKey(
        CardNumberValueKey)) {
      _PaymentCaptureViewTextEditingControllers[CardNumberValueKey]?.text =
          value ?? '';
    }
  }

  set cardOwnerValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          CardOwnerValueKey: value,
        }),
    );

    if (_PaymentCaptureViewTextEditingControllers.containsKey(
        CardOwnerValueKey)) {
      _PaymentCaptureViewTextEditingControllers[CardOwnerValueKey]?.text =
          value ?? '';
    }
  }

  set cardExpiryValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          CardExpiryValueKey: value,
        }),
    );

    if (_PaymentCaptureViewTextEditingControllers.containsKey(
        CardExpiryValueKey)) {
      _PaymentCaptureViewTextEditingControllers[CardExpiryValueKey]?.text =
          value ?? '';
    }
  }

  set cardCvvValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          CardCvvValueKey: value,
        }),
    );

    if (_PaymentCaptureViewTextEditingControllers.containsKey(
        CardCvvValueKey)) {
      _PaymentCaptureViewTextEditingControllers[CardCvvValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasCardNumber =>
      this.formValueMap.containsKey(CardNumberValueKey) &&
      (cardNumberValue?.isNotEmpty ?? false);
  bool get hasCardOwner =>
      this.formValueMap.containsKey(CardOwnerValueKey) &&
      (cardOwnerValue?.isNotEmpty ?? false);
  bool get hasCardExpiry =>
      this.formValueMap.containsKey(CardExpiryValueKey) &&
      (cardExpiryValue?.isNotEmpty ?? false);
  bool get hasCardCvv =>
      this.formValueMap.containsKey(CardCvvValueKey) &&
      (cardCvvValue?.isNotEmpty ?? false);

  bool get hasCardNumberValidationMessage =>
      this.fieldsValidationMessages[CardNumberValueKey]?.isNotEmpty ?? false;
  bool get hasCardOwnerValidationMessage =>
      this.fieldsValidationMessages[CardOwnerValueKey]?.isNotEmpty ?? false;
  bool get hasCardExpiryValidationMessage =>
      this.fieldsValidationMessages[CardExpiryValueKey]?.isNotEmpty ?? false;
  bool get hasCardCvvValidationMessage =>
      this.fieldsValidationMessages[CardCvvValueKey]?.isNotEmpty ?? false;

  String? get cardNumberValidationMessage =>
      this.fieldsValidationMessages[CardNumberValueKey];
  String? get cardOwnerValidationMessage =>
      this.fieldsValidationMessages[CardOwnerValueKey];
  String? get cardExpiryValidationMessage =>
      this.fieldsValidationMessages[CardExpiryValueKey];
  String? get cardCvvValidationMessage =>
      this.fieldsValidationMessages[CardCvvValueKey];
}

extension Methods on FormViewModel {
  setCardNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CardNumberValueKey] = validationMessage;
  setCardOwnerValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CardOwnerValueKey] = validationMessage;
  setCardExpiryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CardExpiryValueKey] = validationMessage;
  setCardCvvValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CardCvvValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    cardNumberValue = '';
    cardOwnerValue = '';
    cardExpiryValue = '';
    cardCvvValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CardNumberValueKey: getValidationMessage(CardNumberValueKey),
      CardOwnerValueKey: getValidationMessage(CardOwnerValueKey),
      CardExpiryValueKey: getValidationMessage(CardExpiryValueKey),
      CardCvvValueKey: getValidationMessage(CardCvvValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _PaymentCaptureViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _PaymentCaptureViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      CardNumberValueKey: getValidationMessage(CardNumberValueKey),
      CardOwnerValueKey: getValidationMessage(CardOwnerValueKey),
      CardExpiryValueKey: getValidationMessage(CardExpiryValueKey),
      CardCvvValueKey: getValidationMessage(CardCvvValueKey),
    });
