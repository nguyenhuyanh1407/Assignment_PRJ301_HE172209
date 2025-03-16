<%-- 
    Document   : agenda
    Created on : Mar 6, 2025, 2:00:59 PM
    Author     : ibm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agenda</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-blue-50 to-blue-100 min-h-screen flex flex-col items-center p-6">

    <!-- Tiêu đề -->
    <h2 class="text-3xl font-bold text-gray-800 mb-4">Agenda Leave Management</h2>

    <!-- Chọn khoảng thời gian -->
    <div class="bg-white p-4 rounded-lg shadow-md mb-6">
        <label class="text-gray-700 font-medium">Date:</label>
        <input type="date" class="border border-gray-300 rounded-md px-2 py-1 mx-2">
        <input type="date" class="border border-gray-300 rounded-md px-2 py-1 mx-2">
        <button class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md ml-2">Apply</button>
    </div>

    <!-- Bảng tình trạng nhân sự -->
    <div class="overflow-x-auto bg-white p-4 rounded-lg shadow-md">
        <table class="table-auto border-collapse w-full text-center">
            <thead>
                <tr class="bg-gray-200">
                    <th class="border px-4 py-2">Staff</th>
                    <th class="border px-4 py-2">1/1</th>
                    <th class="border px-4 py-2">2/1</th>
                    <th class="border px-4 py-2">3/1</th>
                    <th class="border px-4 py-2">4/1</th>
                    <th class="border px-4 py-2">5/1</th>
                    <th class="border px-4 py-2">6/1</th>
                    <th class="border px-4 py-2">7/1</th>
                    <th class="border px-4 py-2">8/1</th>
                    <th class="border px-4 py-2">9/1</th>
                </tr>
            </thead>
            <tbody>
                <tr class="bg-white">
                    <td class="border px-4 py-2 font-semibold">Mr A</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-red-200">✘</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-red-200">✘</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                </tr>
                <tr class="bg-white">
                    <td class="border px-4 py-2 font-semibold">Mr B</td>
                    <td class="border px-4 py-2 bg-red-200">✘</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-red-200">✘</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-red-200">✘</td>
                </tr>
                <tr class="bg-white">
                    <td class="border px-4 py-2 font-semibold">Mr C</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-red-200">✘</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-red-200">✘</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                    <td class="border px-4 py-2 bg-green-200">✔</td>
                </tr>
            </tbody>
        </table>
    </div>

</body>
</html>

