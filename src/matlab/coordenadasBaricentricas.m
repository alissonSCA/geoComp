function [u,v,w] = coordenadasBaricentricas(P,p)
    aP = areaOrientada(P);
    u = areaOrientada([p;P(2,:);P(3,:)])/aP;
    v = areaOrientada([P(1,:);p;P(3,:)])/aP;
    w = areaOrientada([P(1,:);P(2,:);p])/aP;
end