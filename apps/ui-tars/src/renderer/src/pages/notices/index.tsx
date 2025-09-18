/**
 * Copyright (c) 2025 Noshi
 * SPDX-License-Identifier: Apache-2.0
 */
import { useEffect, useState } from 'react';

export default function NoticesPage() {
  const [licenseContent, setLicenseContent] = useState('');
  const [noticeContent, setNoticeContent] = useState('');

  useEffect(() => {
    // In a real implementation, these would be loaded from the actual files
    setLicenseContent(`Apache License
Version 2.0, January 2004
http://www.apache.org/licenses/

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

1. Definitions.

"License" shall mean the terms and conditions for use, reproduction,
and distribution as defined by Sections 1 through 9 of this document.

... (full license text would be here)
`);

    setNoticeContent(`Noshi Natural Action Agent Vessel
Copyright (c) 2025 Noshi

This software contains open source components. The following is a list of open source software components used in this software:

================================================================================

This product includes software originally developed by ByteDance, Inc. and its affiliates.
UI-TARS Desktop - Copyright (c) 2025 Bytedance, Inc. and its affiliates.
Licensed under the Apache License, Version 2.0.

================================================================================

Additional open source components are used in this software.
For a complete list of dependencies and their licenses, please refer to the package.json files in this repository.

================================================================================

The complete text of all applicable licenses can be found in the LICENSE file included with this software distribution.`);
  }, []);

  return (
    <div className="container mx-auto p-6 max-w-4xl">
      <h1 className="text-3xl font-bold mb-6">Open-Source Notices</h1>

      <div className="mb-8">
        <h2 className="text-2xl font-semibold mb-4">Notice</h2>
        <div className="bg-gray-50 p-4 rounded-lg">
          <pre className="whitespace-pre-wrap text-sm">{noticeContent}</pre>
        </div>
      </div>

      <div className="mb-8">
        <h2 className="text-2xl font-semibold mb-4">License</h2>
        <div className="bg-gray-50 p-4 rounded-lg">
          <pre className="whitespace-pre-wrap text-sm">{licenseContent}</pre>
        </div>
      </div>
    </div>
  );
}
