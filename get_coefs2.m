function cis=get_coefs2(n, k, eps,domain_fractions,probability_fractions)
%last two inputs are vectors with one entry per "bucket" in the domain;
%each of these vectors must sum to 1. domain_fractions lists, for each
%bucket, what fraction of the domain elements are in it;
%probability_fractions lists the amount of probability mass in the bucket.
%for the uniform distribution, both these arguments should be 1.
    [in,fval]=bfgs2(@(in)experimentouter1b(in(1),in(2),in(3),probability_fractions./domain_fractions*k/n,domain_fractions,eps*k/n),[.5 0 0]');
    [~,~,cis]=experimentouter1b(in(1),in(2),in(3),probability_fractions./domain_fractions*k/n,domain_fractions,eps*k/n);
    cis=cis(1:k+1,:); %will throw an error if k>100 currently, and this is ok
end
