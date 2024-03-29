function out = ic_gauss(x,y)

    [gridx, gridy] = meshgrid(x, y);

    out = 5*mvnpdf([gridx(:) gridy(:)]);
    out = reshape(out, size(gridx));
    out( out<= 1e-3 ) = 0;
end

