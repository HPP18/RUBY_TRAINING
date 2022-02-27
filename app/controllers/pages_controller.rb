class PagesController < ApplicationController
  def qr_code_generate
  end

  def qr_code_show
    qrcode = RQRCode::QRCode.new(params[:content].to_s)

    @svg = qrcode.as_svg(
      offset: 0,
      color: "000",
      shape_rendering: "crispEdges",
      module_px_size: 12,
      standalone: true,
    )
  end

  def qr_code_download
    send_data RQRCode::QRCode.new(params[:content].to_s).as_png(size: 300), type: "image/png", disposition: "attachment"
  end
end
