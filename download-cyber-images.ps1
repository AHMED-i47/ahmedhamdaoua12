# Script PowerShell pour télécharger des images de cybersécurité
$ErrorActionPreference = "Stop"

# Créer le dossier pour les nouvelles images
$outputPath = "static/images/site"
if (-not (Test-Path $outputPath)) {
    New-Item -ItemType Directory -Path $outputPath -Force
}

# Liste des images à télécharger
$imageUrls = @{
    "site-logo.png" = "https://images.pexels.com/photos/5380642/pexels-photo-5380642.jpeg"
    "site-banner.jpg" = "https://images.pexels.com/photos/1181671/pexels-photo-1181671.jpeg"
    "cyber-shield.png" = "https://images.pexels.com/photos/60504/security-protection-anti-virus-software-60504.jpeg"
    "cyber-lock.jpg" = "https://images.pexels.com/photos/60504/security-protection-anti-virus-software-60504.jpeg"
    "cyber-security.jpg" = "https://images.pexels.com/photos/5380671/pexels-photo-5380671.jpeg"
}

# Télécharger chaque image
foreach ($image in $imageUrls.GetEnumerator()) {
    $outputFile = Join-Path $outputPath $image.Key
    try {
        Write-Host "Téléchargement de $($image.Key)..."
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0")
        $webClient.DownloadFile($image.Value, $outputFile)
    }
    catch {
        Write-Host "Erreur lors du téléchargement de $($image.Key): $_"
    }
    finally {
        if ($webClient) {
            $webClient.Dispose()
        }
    }
    Start-Sleep -Seconds 2
} 