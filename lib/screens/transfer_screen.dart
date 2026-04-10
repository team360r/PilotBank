import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int _currentStep = 0;

  final _recipientFormKey = GlobalKey<FormState>();
  final _amountFormKey = GlobalKey<FormState>();
  final _referenceFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _sortCodeController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _amountController = TextEditingController();
  final _referenceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sortCodeController.dispose();
    _accountNumberController.dispose();
    _amountController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  bool _validateCurrentStep() {
    switch (_currentStep) {
      case 0:
        return _recipientFormKey.currentState?.validate() ?? false;
      case 1:
        return _amountFormKey.currentState?.validate() ?? false;
      case 2:
        return _referenceFormKey.currentState?.validate() ?? false;
      default:
        return false;
    }
  }

  void _onStepContinue() {
    if (!_validateCurrentStep()) return;

    if (_currentStep < 2) {
      setState(() => _currentStep += 1);
    } else {
      _showConfirmationDialog();
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1);
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Transfer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _confirmationRow('To', _nameController.text),
            _confirmationRow('Sort code', _sortCodeController.text),
            _confirmationRow('Account', _accountNumberController.text),
            _confirmationRow('Amount', '£${_amountController.text}'),
            _confirmationRow(
              'Reference',
              _referenceController.text.isEmpty
                  ? '(none)'
                  : _referenceController.text,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Transfer submitted successfully'),
                  backgroundColor: AppColors.success,
                ),
              );
              _resetForm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  Widget _confirmationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _resetForm() {
    _nameController.clear();
    _sortCodeController.clear();
    _accountNumberController.clear();
    _amountController.clear();
    _referenceController.clear();
    setState(() => _currentStep = 0);
  }

  String? _validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an amount';
    }
    final amount = double.tryParse(value.trim());
    if (amount == null) {
      return 'Please enter a valid number';
    }
    if (amount <= 0) {
      return 'Amount must be greater than zero';
    }
    if (amount > 25000) {
      return 'Amount cannot exceed £25,000';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _onStepContinue,
        onStepCancel: _currentStep > 0 ? _onStepCancel : null,
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(_currentStep == 2 ? 'Submit' : 'Continue'),
                ),
                if (_currentStep > 0) ...[
                  const SizedBox(width: 12),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('Back'),
                  ),
                ],
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Recipient'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            content: Form(
              key: _recipientFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Recipient name',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the recipient name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _sortCodeController,
                    decoration: const InputDecoration(
                      labelText: 'Sort code',
                      hintText: '00-00-00',
                      prefixIcon: Icon(Icons.grid_3x3),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d-]')),
                      LengthLimitingTextInputFormatter(8),
                    ],
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the sort code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _accountNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Account number',
                      prefixIcon: Icon(Icons.account_balance_outlined),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the account number';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Amount'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            content: Form(
              key: _amountFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount (£)',
                      prefixIcon: Icon(Icons.currency_pound),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                    textInputAction: TextInputAction.done,
                    validator: _validateAmount,
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Reference'),
            isActive: _currentStep >= 2,
            state: StepState.indexed,
            content: Form(
              key: _referenceFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _referenceController,
                    decoration: const InputDecoration(
                      labelText: 'Payment reference (optional)',
                      prefixIcon: Icon(Icons.note_outlined),
                    ),
                    maxLength: 18,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
