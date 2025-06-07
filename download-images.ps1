# Script PowerShell pour télécharger les images de cybersécurité
$ErrorActionPreference = "Stop"

$imageUrls = @{
    "cyber-banner.jpg" = "https://images.pexels.com/photos/1181671/pexels-photo-1181671.jpeg"
    "security-tools.png" = "https://images.pexels.com/photos/60504/security-protection-anti-virus-software-60504.jpeg"
    "network-security.jpg" = "https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg"
    "data-protection.jpg" = "https://images.pexels.com/photos/1181676/pexels-photo-1181676.jpeg"
    "ethical-hacking.png" = "https://images.pexels.com/photos/1181677/pexels-photo-1181677.jpeg"
    "projects-banner.jpg" = "https://images.pexels.com/photos/1181678/pexels-photo-1181678.jpeg"
    "secure-sharing.png" = "https://images.pexels.com/photos/1181679/pexels-photo-1181679.jpeg"
    "edu-platform.jpg" = "https://images.pexels.com/photos/1181680/pexels-photo-1181680.jpeg"
    "pentest-lab.png" = "https://images.pexels.com/photos/1181681/pexels-photo-1181681.jpeg"
    "security-dashboard.jpg" = "https://images.pexels.com/photos/1181682/pexels-photo-1181682.jpeg"
    "ctf-challenges.png" = "https://images.pexels.com/photos/1181683/pexels-photo-1181683.jpeg"
    "cyber-intro.jpg" = "https://images.pexels.com/photos/1181684/pexels-photo-1181684.jpeg"
    "security-pillars.png" = "https://images.pexels.com/photos/1181685/pexels-photo-1181685.jpeg"
    "cyber-threats.jpg" = "https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg"
    "social-engineering.png" = "https://images.pexels.com/photos/1181687/pexels-photo-1181687.jpeg"
    "network-attacks.jpg" = "https://images.pexels.com/photos/1181688/pexels-photo-1181688.jpeg"
    "best-practices.png" = "https://images.pexels.com/photos/1181689/pexels-photo-1181689.jpeg"
    "security-resources.jpg" = "https://images.pexels.com/photos/1181690/pexels-photo-1181690.jpeg"
}

# Créer le dossier s'il n'existe pas
$outputPath = "static/images/cybersecurity"
if (-not (Test-Path $outputPath)) {
    New-Item -ItemType Directory -Path $outputPath -Force
}

# Supprimer les anciennes images si elles existent
Get-ChildItem -Path $outputPath -File | Remove-Item -Force

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
        # URL de secours si l'image principale échoue
        $backupUrl = "https://images.pexels.com/photos/60504/security-protection-anti-virus-software-60504.jpeg"
        try {
            Write-Host "Tentative avec l'URL de secours..."
            $webClient.DownloadFile($backupUrl, $outputFile)
        }
        catch {
            Write-Host "Échec également avec l'URL de secours"
        }
    }
    finally {
        if ($webClient) {
            $webClient.Dispose()
        }
    }
    # Attendre un peu entre chaque téléchargement
    Start-Sleep -Seconds 2
} 