// apps/admin/app/layout.tsx
import './globals.css';
import type { ReactNode } from 'react';
import AccountMenu from '../../src/components/AccountMenu'; // fixed relative path

export const metadata = {
  title: 'TripSafe Admin',
  description: 'Tourist safety system admin panel',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body className="bg-white text-slate-800">
        <div className="min-h-screen grid grid-cols-[240px_1fr]">
          {/* Sidebar */}
          <aside className="bg-slate-50 border-r">
            <div className="p-4 text-xl font-semibold text-brand">TripSafe</div>
            <nav className="flex flex-col gap-2 p-4 text-sm">
              <a href="/map" className="hover:text-brand">Map</a>
              <a href="/alerts" className="hover:text-brand">Alerts</a>
              <a href="/tourists" className="hover:text-brand">Tourists</a>
              <a href="/incidents" className="hover:text-brand">Incidents</a>
              <a href="/reports" className="hover:text-brand">Reports</a>
            </nav>
          </aside>

          {/* Main content */}
          <main className="p-4">
            <div className="mb-4 flex items-center justify-end">
              <AccountMenu />
            </div>
            <div className="p-2">{children}</div>
          </main>
        </div>
      </body>
    </html>
  );
}
