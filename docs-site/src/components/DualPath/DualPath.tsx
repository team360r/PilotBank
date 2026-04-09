import React, { useState } from 'react';
import styles from './DualPath.module.css';

interface DualPathProps {
  exercise: string;
  children: React.ReactNode;
}

export function DualPath({ exercise, children }: DualPathProps) {
  const [activeTab, setActiveTab] = useState<'manual' | 'ai' | 'check'>('ai');

  const childArray = React.Children.toArray(children);
  const manual = childArray.find(
    (c): c is React.ReactElement => React.isValidElement(c) && c.type === Manual
  );
  const ai = childArray.find(
    (c): c is React.ReactElement => React.isValidElement(c) && c.type === AIAssisted
  );
  const check = childArray.find(
    (c): c is React.ReactElement => React.isValidElement(c) && c.type === CrossCheck
  );

  return (
    <div className={styles.container} data-exercise={exercise}>
      <div className={styles.tabs} role="tablist">
        <button
          role="tab"
          aria-selected={activeTab === 'manual'}
          className={`${styles.tab} ${activeTab === 'manual' ? styles.tabActiveManual : ''}`}
          onClick={() => setActiveTab('manual')}
        >
          ✋ Manual
        </button>
        <button
          role="tab"
          aria-selected={activeTab === 'ai'}
          className={`${styles.tab} ${activeTab === 'ai' ? styles.tabActiveAI : ''}`}
          onClick={() => setActiveTab('ai')}
        >
          🤖 AI-Assisted
        </button>
        <button
          role="tab"
          aria-selected={activeTab === 'check'}
          className={`${styles.tab} ${activeTab === 'check' ? styles.tabActiveCheck : ''}`}
          onClick={() => setActiveTab('check')}
        >
          ✅ Cross-Check
        </button>
      </div>
      <div className={styles.content} role="tabpanel">
        {activeTab === 'manual' && manual}
        {activeTab === 'ai' && ai}
        {activeTab === 'check' && check}
      </div>
    </div>
  );
}

export function Manual({ children }: { children: React.ReactNode }) {
  return <div className={styles.panelManual}>{children}</div>;
}

export function AIAssisted({ children }: { children: React.ReactNode }) {
  return <div className={styles.panelAI}>{children}</div>;
}

export function CrossCheck({ children }: { children: React.ReactNode }) {
  return <div className={styles.panelCheck}>{children}</div>;
}
