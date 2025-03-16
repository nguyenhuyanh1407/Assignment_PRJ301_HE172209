<%-- 
    Document   : review
    Created on : Mar 6, 2025, 2:01:07 PM
    Author     : ibm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Request System</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-blue-50 to-blue-100 min-h-screen flex flex-col items-center justify-center">

    <!-- LOGO & TITLE -->
    <div class="text-center mb-6">
        <span class="text-3xl font-bold text-orange-600 tracking-wide flex items-center gap-3">
            <img src="../../images/logo.png" width="80" height="55" class="inline-block">
            BAMI'S KING
        </span>
    </div>

    <!-- CARD CONTAINER -->
    <div class="bg-white p-8 rounded-xl shadow-lg w-full max-w-md border border-gray-200">
        <h2 class="text-2xl font-bold text-gray-800 text-center">Leave Request</h2>
        <hr class="my-4">

        <!-- FORM -->
        <form action="" method="POST" class="space-y-5">
            
            <div class="flex justify-between">
                <span class="font-medium text-gray-600">Title:</span> 
                <span class="text-gray-800">Đơn xin nghỉ phép</span>
            </div>

            <div class="flex justify-between">
                <span class="font-medium text-gray-600">Name:</span> 
                <span class="text-gray-800">Mr C</span>
            </div>

            <div class="flex justify-between">
                <span class="font-medium text-gray-600">Role:</span> 
                <span class="text-gray-800">Staff</span>
            </div>

            <div class="flex justify-between">
                <span class="font-medium text-gray-600">Divisions:</span> 
                <span class="text-gray-800">Sale</span>
            </div>

            <div class="flex justify-between">
                <span class="font-medium text-gray-600">Reason:</span> 
                <span class="text-gray-800">Đi chơi</span>
            </div>

            <div class="flex justify-between">
                <span class="font-medium text-gray-600">From:</span> 
                <span class="text-gray-800">3/3/2025</span>
            </div>

            <div class="flex justify-between">
                <span class="font-medium text-gray-600">To:</span> 
                <span class="text-gray-800">5/3/2025</span>
            </div>

            <div class="flex gap-3 pt-4">
                <button type="submit" class="flex-1 bg-red-600 hover:bg-red-700 text-white py-2 rounded-lg shadow-md transition-all">
                    Reject
                </button>
                <button type="submit" class="flex-1 bg-green-600 hover:bg-green-700 text-white py-2 rounded-lg shadow-md transition-all">
                    Approved
                </button>
            </div>

        </form>
    </div>

</body>
</html>

