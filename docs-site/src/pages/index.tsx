import type {ReactNode} from 'react';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import styles from './index.module.css';

const chapters = [
  { num: 0, title: 'Pre-Flight Checklist', branch: 'chapter-0-preflight', desc: 'Install and configure your AI coding tools', time: '~20 min', antiPattern: 'Ghost Copilot' },
  { num: 1, title: 'Filing Your Flight Plan', branch: 'chapter-1-flight-plan', desc: 'Learn effective prompting for Flutter code generation', time: '~25 min', antiPattern: 'Fly-by-Night' },
  { num: 2, title: 'Instrument Scan', branch: 'chapter-2-instrument-scan', desc: 'Read and evaluate AI suggestions critically', time: '~30 min', antiPattern: 'Autopilot Complacency' },
  { num: 3, title: 'Takeoff', branch: 'chapter-3-takeoff', desc: 'Use AI for boilerplate: routing, navigation, theme', time: '~30 min', antiPattern: 'Backseat Driver' },
  { num: 4, title: 'Cruise Altitude', branch: 'chapter-4-cruise', desc: 'Build UI from specifications with AI assistance', time: '~35 min', antiPattern: 'Armchair Architect' },
  { num: 5, title: 'Turbulence', branch: 'chapter-5-turbulence', desc: 'Debug when AI gets it confidently wrong', time: '~30 min', antiPattern: 'False Horizon' },
  { num: 6, title: 'Holding Pattern', branch: 'chapter-6-holding-pattern', desc: 'Write tests with AI — and catch what it misses', time: '~30 min', antiPattern: 'Rubber Stamp' },
  { num: 7, title: 'Go-Around', branch: 'chapter-7-go-around', desc: 'Refactor code with targeted AI assistance', time: '~25 min', antiPattern: 'Lost in the Clouds' },
  { num: 8, title: 'Radio Calls', branch: 'chapter-8-radio-calls', desc: 'Generate documentation, commit messages, and PR descriptions', time: '~20 min', antiPattern: 'Radio Silence' },
  { num: 9, title: 'Mayday Protocol', branch: 'chapter-9-mayday', desc: 'Understand security and IP risks of AI tools', time: '~25 min', antiPattern: 'Open Cockpit' },
  { num: 10, title: 'Crew Resource Management', branch: 'chapter-10-crew-resource', desc: 'Integrate AI tools into team workflows', time: '~25 min', antiPattern: 'Solo Pilot' },
  { num: 11, title: 'Landing', branch: 'chapter-11-landing', desc: 'Ship with CI, retrospective, and personal workflow', time: '~20 min', antiPattern: 'Crash Landing' },
];

const features = [
  { icon: '⇄', title: 'The Dual-Path Method',
    desc: 'Every task is tried by hand and with AI. Compare, cross-check, learn when to delegate.' },
  { icon: '12', title: '12 Progressive Chapters',
    desc: 'From your first AI suggestion to a team adoption strategy. ~5 hours of hands-on learning.' },
  { icon: '🔧', title: 'Tool-Agnostic Principles',
    desc: 'Works with Copilot, Claude Code, Cursor, or any AI assistant. The skills transfer.' },
];

function HeroSection(): ReactNode {
  return (
    <header className={styles.hero}>
      <div className={styles.heroInner}>
        <p className={styles.heroPre}>Flutter AI-Assisted Development Tutorial</p>
        <h1 className={styles.heroTitle}>PilotBank</h1>
        <p className={styles.heroTagline}>
          You're the pilot. AI is your copilot.<br />
          Learn when to hand over the controls — and when to take them back.
        </p>
        <div className={styles.heroButtons}>
          <Link className={styles.btnPrimary} to="/chapters/preflight">Start Chapter 0</Link>
          <Link className={styles.btnSecondary} to="/intro">Read Introduction</Link>
        </div>
      </div>
    </header>
  );
}

function FeaturesSection(): ReactNode {
  return (
    <section className={styles.features}>
      <div className={styles.container}>
        <div className={styles.featureGrid}>
          {features.map((f) => (
            <div key={f.title} className={styles.featureCard}>
              <div className={styles.featureIcon}>{f.icon}</div>
              <h3 className={styles.featureTitle}>{f.title}</h3>
              <p className={styles.featureDesc}>{f.desc}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

function ChapterRoadmap(): ReactNode {
  return (
    <section className={styles.roadmap}>
      <div className={styles.container}>
        <h2 className={styles.sectionTitle}>Chapter Roadmap</h2>
        <p className={styles.sectionSubtitle}>Twelve focused chapters, each building on the last. Total time: roughly 5 hours.</p>
        <ol className={styles.chapterList}>
          {chapters.map((ch) => (
            <li key={ch.num} className={styles.chapterItem}>
              <span className={styles.chapterNum}>{ch.num}</span>
              <div className={styles.chapterBody}>
                <div className={styles.chapterHeader}>
                  <strong className={styles.chapterTitle}>{ch.title}</strong>
                  <span className={styles.chapterTime}>{ch.time}</span>
                  <span className={styles.antiPatternBadge}>{ch.antiPattern}</span>
                </div>
                <p className={styles.chapterDesc}>{ch.desc}</p>
              </div>
            </li>
          ))}
        </ol>
      </div>
    </section>
  );
}

function QuickStartSection(): ReactNode {
  return (
    <section className={styles.quickstart}>
      <div className={styles.container}>
        <h2 className={styles.sectionTitle}>Quick Start</h2>
        <p className={styles.sectionSubtitle}>Three steps and you are up — app on device, guide in your browser.</p>
        <div className={styles.quickstartGrid}>
          <div className={styles.codeBlock}>
            <p className={styles.codeLabel}>1. Clone and install</p>
            <pre className={styles.pre}><code>{`git clone git@github.com:team360r/PilotBank.git
cd PilotBank
./setup.sh`}</code></pre>
          </div>
          <div className={styles.codeBlock}>
            <p className={styles.codeLabel}>2. Start everything</p>
            <pre className={styles.pre}><code>{`./start.sh
# Opens browser + launches app`}</code></pre>
          </div>
          <div className={styles.codeBlock}>
            <p className={styles.codeLabel}>3. Open in your IDE</p>
            <pre className={styles.pre}><code>{`code .
# VS Code — or open in Android Studio`}</code></pre>
          </div>
        </div>
      </div>
    </section>
  );
}

function CtaSection(): ReactNode {
  return (
    <section className={styles.cta}>
      <div className={styles.container}>
        <h2 className={styles.ctaTitle}>Ready for takeoff?</h2>
        <p className={styles.ctaSubtitle}>
          Start with Chapter 0 — install your AI tools, configure your environment,
          and prepare for twelve chapters of hands-on learning.
        </p>
        <Link className={styles.btnPrimary} to="/chapters/preflight">Start Chapter 0: Pre-Flight Checklist</Link>
      </div>
    </section>
  );
}

export default function Home(): ReactNode {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout title={siteConfig.title}
      description="Learn AI-assisted Flutter development with the Dual-Path method. 12 progressive chapters covering prompting, evaluation, debugging, testing, and team workflows.">
      <HeroSection />
      <main>
        <FeaturesSection />
        <ChapterRoadmap />
        <QuickStartSection />
        <CtaSection />
      </main>
    </Layout>
  );
}
