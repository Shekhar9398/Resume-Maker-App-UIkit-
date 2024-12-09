import UIKit
import PDFKit

extension UIViewController {
    func exportToPDF(hideViews: [UIView] = []) -> URL? {
        // Define the page size (match the view's size or set custom dimensions)
        let pdfPageFrame = view.bounds

        // Create a temporary file URL for the PDF
        let tempPDFURL = FileManager.default.temporaryDirectory.appendingPathComponent("ExportedPage.pdf")

        // Temporarily hide specified views
        hideViews.forEach { $0.isHidden = true }

        // Initialize PDF renderer
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pdfPageFrame)

        do {
            // Render the view's content to the PDF
            try pdfRenderer.writePDF(to: tempPDFURL) { context in
                context.beginPage()
                view.layer.render(in: context.cgContext)
            }

            // Restore hidden views
            hideViews.forEach { $0.isHidden = false }

            return tempPDFURL
        } catch {
            print("Failed to create PDF: \(error.localizedDescription)")
            
            // Restore hidden views even if rendering fails
            hideViews.forEach { $0.isHidden = false }
            return nil
        }
    }
}
