source .env

FUNCTION_NAME=mint_private
ARG1=aleo1axv6c4wuah0vaf9mccu2xcv72eup8ncd35v2j0mt3mnkwx04dg9s4r8888
ARG2=100000000u128

snarkos developer execute \
--private-key ${PRIVATE_KEY} \
--query ${API_PREFIX} \
--priority-fee 100 $PROGRAM_NAME $FUNCTION_NAME $ARG1 $ARG2 \
--broadcast ${API_PREFIX}/testnet3/transaction/broadcast