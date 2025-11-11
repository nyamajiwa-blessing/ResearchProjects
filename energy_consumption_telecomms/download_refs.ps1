# Create a folder for downloads
New-Item -ItemType Directory -Force -Path "$PSScriptRoot\telecom_energy_refs" | Out-Null
Set-Location "$PSScriptRoot\telecom_energy_refs"

# Define list of URLs and filenames
$papers = @{
    "https://www.mdpi.com/1424-8220/24/14/4609/pdf" = "01_Ezzeddine2024_AI5G.pdf"
    "https://arxiv.org/pdf/2101.11246.pdf" = "02_LopezPerez2021_RAN_EE.pdf"
    "https://arxiv.org/pdf/1809.02159.pdf" = "03_YeZhang2018_DRAG.pdf"
    "https://www.itu.int/dms_pub/itu-s/opb/tut/T-TUT-L.1331-202201-PDF-E.pdf" = "04_ITU_L1331.pdf"
    "https://www.gsma.com/solutions-and-impact/connectivity-for-good/external-affairs/wp-content/uploads/2023/10/Energy-Challenges-for-Mobile-Operators-in-SSA-1.pdf" = "05_GSMA2023_Energy_SSA.pdf"
    "https://journaljenrr.com/index.php/JENRR/article/download/268/538" = "06_Mapfumo2023_Solar_Telecom.pdf"
    "https://arxiv.org/pdf/2302.08223.pdf" = "07_Marwaha2023_MassiveMIMO.pdf"
    "https://research.google.com/pubs/archive/42542.pdf" = "08_DeepMind2016_DataCentre.pdf"
    "https://www.zicta.zm/storage/posts/attachments/ZICTA_2024_Annual_Report.pdf" = "09_ZICTA2024_Report.pdf"
    "https://mtn-investor.com/media/attachments/2024/05/05/mtn-fy2024-sustainability-report.pdf" = "10_MTN2024_Sustainability.pdf"
    "https://pureportal.strath.ac.uk/files/19912302/Hamdoun_et_al_2012_Survey_and_applications_of_standardised_energy_metrics.pdf" = "11_Hamdoun2012_Metrics.pdf"
    "https://event-assets.gsma.com/pdf/GSMA_ME_SSA_2024_Web.pdf" = "12_GSMA2024_Mobile_Economy_SSA.pdf"
}

# Download each file
foreach ($url in $papers.Keys) {
    $filename = $papers[$url]
    Write-Host "Downloading $filename..."
    Invoke-WebRequest -Uri $url -OutFile $filename -UseBasicParsing
}

# Zip all PDFs
Compress-Archive -Path *.pdf -DestinationPath "$PSScriptRoot\Telecom_Energy_Refs.zip" -Force

Write-Host "`n✅ All files downloaded and zipped successfully!"
Write-Host "ZIP saved as: $PSScriptRoot\Telecom_Energy_Refs.zip"