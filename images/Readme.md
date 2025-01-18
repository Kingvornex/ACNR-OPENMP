<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Gallery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 10px;
            padding: 20px;
            width: 100%;
            max-width: 1200px;
        }
        .gallery img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        .gallery img:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="gallery">
        <!-- Server Updates changelog images -->
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/1.4.png" alt="1.4">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/1.5.png" alt="1.5">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/1.6.png" alt="1.6">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/1.7.png" alt="1.7">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/1.8.5.png" alt="1.8.5">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/1.9.png" alt="1.9">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/2.1.0.png" alt="2.0.5">
        
        <!-- ACNR ADMIN CMDs -->
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ACNR_ADMIN_CMDs_Just_SAMP_RozBlog_COM_.png" alt="ACNR Admin Commands">
        
        <!-- ACNR VIP CMDs -->
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ACNR_VIP_CMDs_Just_SaMp_RozBlog_COM_.png" alt="ACNR VIP Commands">
        
        <!-- Logo Images -->
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(1).png" alt="Logo 1">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(2).png" alt="Logo 2">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(3).png" alt="Logo 3">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(4).png" alt="Logo 4">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(5).png" alt="Logo 5">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(6).png" alt="Logo 6">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(7).png" alt="Logo 7">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(8).png" alt="Logo 8">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/ai%20(9).png" alt="Logo 9">
        
        <!-- Banner Images -->
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/banner%20(1).jpeg" alt="Banner 1">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/banner%20(1).jpg" alt="Banner 2">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/banner%20(1).png" alt="Banner 3">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/banner%20(2).jpg" alt="Banner 4">
        <img src="https://raw.githubusercontent.com/Kingvornex/ACNR-OPENMP/refs/heads/main/images/banner%20(2).png" alt="Banner 5">
        
        <!-- Version 1.7 In-game server screenshots -->
        <img src="https://github.com/Kingvornex/ACNR-OPENMP/blob/main/images/1.7/sa-mp-000.png" alt="Screenshot 1">
        <img src="https://github.com/Kingvornex/ACNR-OPENMP/blob/main/images/1.7/sa-mp-0000.png" alt="Screenshot 2">
        <img src="https://github.com/Kingvornex/ACNR-OPENMP/blob/main/images/1.7/sa-mp-001.png" alt="Screenshot 3">
        <img src="https://github.com/Kingvornex/ACNR-OPENMP/blob/main/images/1.7/sa-mp-0010.png" alt="Screenshot 4">
        <img src="https://github.com/Kingvornex/ACNR-OPENMP/blob/main/images/1.7/sa-mp-002.png" alt="Screenshot 5">
        <!-- Add more images as required -->
    </div>
</body>
</html>
