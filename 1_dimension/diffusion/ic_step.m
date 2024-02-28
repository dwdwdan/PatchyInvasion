function u0 = ic_step(x)

    ic_width = 1;
    step_height = 1;

    if abs(x) < ic_width/2
        u0 = step_height;
    else
        u0 = 0;
    end
end

