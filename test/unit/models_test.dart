import 'package:flutter_test/flutter_test.dart';
import 'package:pilotbank/data/models.dart';
import 'package:pilotbank/data/mock_data.dart';

void main() {
  group('User model', () {
    test('constructs with required fields', () {
      const user = User(id: 'u1', name: 'Test User', email: 'test@test.com');
      expect(user.id, 'u1');
      expect(user.name, 'Test User');
      expect(user.email, 'test@test.com');
    });
  });

  group('Account model', () {
    test('constructs with required fields', () {
      const account = Account(
        id: 'a1',
        name: 'Current Account',
        type: AccountType.current,
        balance: 1234.56,
      );
      expect(account.id, 'a1');
      expect(account.name, 'Current Account');
      expect(account.type, AccountType.current);
      expect(account.balance, 1234.56);
    });

    test('supports negative balances for credit accounts', () {
      const account = Account(
        id: 'a2',
        name: 'Credit Card',
        type: AccountType.credit,
        balance: -500.00,
      );
      expect(account.balance, isNegative);
      expect(account.type, AccountType.credit);
    });
  });

  group('Transaction model', () {
    test('constructs with required fields', () {
      final tx = Transaction(
        id: 'tx1',
        accountId: 'a1',
        amount: 99.99,
        description: 'Test payment',
        date: DateTime(2026, 1, 15),
        type: TransactionType.debit,
      );
      expect(tx.id, 'tx1');
      expect(tx.accountId, 'a1');
      expect(tx.amount, 99.99);
      expect(tx.description, 'Test payment');
      expect(tx.type, TransactionType.debit);
    });
  });

  group('AppNotification model', () {
    test('defaults read to false', () {
      final notif = AppNotification(
        id: 'n1',
        title: 'Test',
        body: 'Body',
        timestamp: DateTime(2026, 1, 1),
      );
      expect(notif.read, isFalse);
    });

    test('accepts explicit read value', () {
      final notif = AppNotification(
        id: 'n1',
        title: 'Test',
        body: 'Body',
        timestamp: DateTime(2026, 1, 1),
        read: true,
      );
      expect(notif.read, isTrue);
    });
  });

  group('AccountType enum', () {
    test('has three values', () {
      expect(AccountType.values.length, 3);
      expect(AccountType.values, contains(AccountType.current));
      expect(AccountType.values, contains(AccountType.savings));
      expect(AccountType.values, contains(AccountType.credit));
    });
  });

  group('TransactionType enum', () {
    test('has two values', () {
      expect(TransactionType.values.length, 2);
      expect(TransactionType.values, contains(TransactionType.credit));
      expect(TransactionType.values, contains(TransactionType.debit));
    });
  });

  group('Mock data', () {
    test('mockUser has expected values', () {
      expect(mockUser.name, 'Alex Johnson');
      expect(mockUser.email, 'alex@pilotbank.dev');
    });

    test('mockAccounts has three accounts', () {
      expect(mockAccounts.length, 3);
    });

    test('mockAccounts contains one of each type', () {
      final types = mockAccounts.map((a) => a.type).toSet();
      expect(types, containsAll([
        AccountType.current,
        AccountType.savings,
        AccountType.credit,
      ]));
    });

    test('mockTransactions contains entries for acc-1', () {
      expect(mockTransactions.containsKey('acc-1'), isTrue);
      expect(mockTransactions['acc-1']!.isNotEmpty, isTrue);
    });

    test('mockNotifications is not empty', () {
      expect(mockNotifications.isNotEmpty, isTrue);
    });

    test('mockNotifications includes both read and unread', () {
      final hasUnread = mockNotifications.any((n) => !n.read);
      final hasRead = mockNotifications.any((n) => n.read);
      expect(hasUnread, isTrue);
      expect(hasRead, isTrue);
    });
  });
}
