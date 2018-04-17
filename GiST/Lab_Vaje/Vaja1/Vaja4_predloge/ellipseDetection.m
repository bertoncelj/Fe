function bestMatch = ellipseDetection(img, params)
    % Fits an ellipse by examining all possible major axes (all pairs of points) and
    % getting the minor axis using hough transform.
    % - based on "A New Efficient Ellipse Detection Method" (Yonghong Xie Qiang , Qiang Ji / 2002)
    % - random subsampling inspired by "Randomized Hough Transform for Ellipse Detection with Result Clustering" (CA Basca, M Talos, R Brad / 2005)
    %
    % - can deal with big amount of noise but can have severe problem with occlusions 
    %   (assumption: major axis end points visible & |major| < |minor|)
    % - reasonably fast due to randomization and full code vectorization
    %
    % - input: binary/grayscale image ; parameters which should override the default ones
    % - returns the strongest fit: [x0 y0 a b alpha score]
    %   (code can be easily extended to keep any number of best matches or all matches above some threshold)
    %
    % ======
    % Copyring (c) 2011 Martin Simonovsky, <mys007@seznam.cz>
    %
    % Redistribution and use in source and binary forms, with or without 
    % modification, are permitted provided that the following conditions are 
    % met:
    % 
    %     * Redistributions of source code must retain the above copyright 
    %       notice, this list of conditions and the following disclaimer.
    %     * Redistributions in binary form must reproduce the above copyright 
    %       notice, this list of conditions and the following disclaimer in 
    %       the documentation and/or other materials provided with the distribution
    %       
    % THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
    % AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
    % IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
    % ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
    % LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
    % CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
    % SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
    % INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
    % CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
    % ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
    % POSSIBILITY OF SUCH DAMAGE.

    if nargin==1; params=[]; end
    % parameters to contrain the search
    if ~isfield(params,'minMajorAxis');     params.minMajorAxis = 20; end %restriction on major axis length
    if ~isfield(params,'maxMajorAxis');     params.maxMajorAxis = 200; end %...
    if ~isfield(params,'maxRotation');      params.maxRotation = 0*pi/180; end %restriction on rotation
    if ~isfield(params,'randomize');        params.randomize = true; end %subsamples all possible point pairs (reduces complexity from cubic to quadratic)
    % 
    if ~isfield(params,'uniformWeights');   params.uniformWeights = true; end %if false, accumulator points are weighted by the grey intensity of the pt in image

    eps = 0.0001;
    bestMatch = 0;

    [Y,X]=find(img);
    N = length(Y);

    dX = repmat(X,[1,N])-repmat(X',[N 1]);
    dY = repmat(Y,[1 N])-repmat(Y',[N,1]);
    
    dists = sqrt( dX.^2 + dY.^2 );
    distsU = triu(dists);
    
    alphas = atan( dY ./ dX );
    
    %get all suitable pairs
    [I,J] = find(distsU>=params.minMajorAxis & distsU<=params.maxMajorAxis & abs(alphas)<=params.maxRotation);
    npairs = length(I);

    if params.randomize
        perm = randperm(npairs);
        pairSubset = perm(1:min(npairs,N*2));
    else
        pairSubset = 1:npairs;
    end
    

%     cont=1;
    for p=pairSubset
        x1=X(I(p)); y1=Y(I(p));
        x2=X(J(p)); y2=Y(J(p));

        %center & major ax
        x0=(x1+x2)/2; y0=(y1+y2)/2;
        a = dists(I(p),J(p))/2;

        thirdPtDistsSq = sum( ([X Y] - repmat([x0 y0],[N 1])).^2, 2);
        K = find(thirdPtDistsSq <= a^2); % (otherwise the formulae in paper do not work)

        %get minor ax propositions for all other points
        fSq = (X(K)-x2).^2 + (Y(K)-y2).^2;
        cosTau = (a^2 + thirdPtDistsSq(K) - fSq) ./ (2*a*sqrt(thirdPtDistsSq(K)));
        cosTau = min(1,max(-1,cosTau)); %inexact float arithmetic?!
        sinTauSq = 1 - cosTau.^2;
        b = sqrt( (a^2 * thirdPtDistsSq(K) .* sinTauSq) ./ (a^2 - thirdPtDistsSq(K) .* cosTau.^2 + eps) );

        %proper bins for b
        idxs = ceil(b+eps);
        
        if params.uniformWeights
            weights = 1;
        else
            weights = img(sub2ind(size(img),Y(K),X(K)));
        end
        accumulator = accumarray(idxs, weights, [params.maxMajorAxis 1]);

        %a bit of smoothing and finding the most busy bin
        accumulator = conv(accumulator,[1 1 1]/3,'same');
        [score, idx] = max(accumulator);

%         if(cont==1)
%             bestMatch = [bestMatch;[x0 y0 a idx alphas(I(p),J(p)) score]];
%             cont=cont+1;
%         end
        
        if (bestMatch(end) < score)
            bestMatch = [x0 y0 a idx alphas(I(p),J(p)) score];
        end
    end

%     figure;
%     image(img);
%     addpath /home/msimonov/work/tracking_games/3rd/ellipse
%     hold on
%     for i=1:size(bestMatch,1)
%         ellipse(bestMatch(i,3),bestMatch(i,4),bestMatch(i,5),bestMatch(i,1),bestMatch(i,2),'w');
%     end
%     hold off
end